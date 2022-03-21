<?php
/*
 * Game yang tersedia:
	- Mobile Legends : mobile-legends
	- Hago : hago
	- Zepeto : zepeto
	- Lords Mobile : lords-mobile
	- Marvel Super War : marvel-super-war
	- Ragnarok M : ragnarok-m-eternal-love-big-cat-coin
	- Speed Drifters : speed-drifters
	- Laplace M : laplace-m
	- Valorant : valorant
	- Higgs Domino : higgs-domino
	- Point Blank : point-blank
	- Dragon Raja : dragon-raja
	- League of Legends: Wild Rift : league-of-legends-wild-rift (testing)
	- Free Fire : free-fire
	- Free Fire Max : free-fire-max
	- Tom and Jerry:chase : tom-and-jerry-chase
	- Cocofun : cocofun (testing)
	- 8 Ball Pool : 8-ball-pool (testing)
	- Auto Chess : auto-chess (testing)
	- Bullet Angel : bullet-angel (testing)
	- Arena of Valor : arena-of-valor
	- Call of Duty MOBILE : call-of-duty-mobile
	- Genshin Impact : genshin-impact
	- IndoPlay : indoplay
	- Domino Gaple Boyaa Qiuqiu : domino-gaple-qiuqiu-boyaa
*/

namespace App\Libraries;

class GameChecker
{
	const BASE_URL = 'https://api-sg.codashop.com/';
	
	public function validation($game, $userId, $zoneId = '')
	{
		$voucherName = $this->_getVoucherName($game);
		if(empty($voucherName)) {
			return ['result' => false, 'data' => ['errorCode' => 'ERR_SCRIPT', 'errorText' => 'Validasi gagal dilakukan (vcname)']];
		}
		
		$denom = $this->_getDenomination($game);
		if(empty($denom)) {
			return ['result' => false, 'data' => ['errorCode' => 'ERR_SCRIPT', 'errorText' => 'Validasi gagal dilakukan (denom)']];
		}
		
		$params = [];
        $params[] = "voucherPricePoint.id={$denom['pricePointId']}";
        $params[] = "voucherPricePoint.price={$denom['pricePointPrice']}";
        $params[] = 'voucherPricePoint.variablePrice=0';
        $params[] = 'n=10%2F21%2F2021-1051';
        $params[] = 'email=';
        $params[] = 'order.data.profile=eyJuYW1lIjoiICIsImRhdGVvZmJpcnRoIjoiIiwiaWRfbm8iOiIifQ%3D%3D';
        $params[] = "user.userId={$userId}";
        $params[] = "user.zoneId={$zoneId}";
        $params[] = 'msisdn=';
        $params[] = "voucherTypeName={$voucherName}";
        $params[] = 'shopLang=id_ID';
        $params[] = 'checkoutId=78ee446c-0bb5-4cef-b163-006c9111f78d';
        $params[] = 'affiliateTrackingId=';
        $params[] = 'impactClickId=';
        $params[] = 'anonymousId=b2082655-f423-40d1-86e2-010edaab85ed';
			
		$response = $this->_curl('initPayment.action', implode('&', $params), 'application/x-www-form-urlencoded');
		if(is_array($response) && isset($response['success']) && $response['success'] && empty($response['errorMsg'])) {
			switch($game) {
                case 'mobile-legends':
                case 'hago':
                case 'higgs-domino':
                case 'valorant':
                case 'speed-drifters':
                case 'lords-mobile':
                case 'point-blank':
                case 'dragon-raja':
                case 'laplace-m':
                case 'marvel-super-war':
                case 'ragnarok-m-eternal-love-big-cat-coin':
                case 'tom-and-jerry-chase':
		case 'league-of-legends-wild-rift':
		case 'zepeto':
		case 'cocofun':
		case '8-ball-pool':
		case 'auto-chess':
		case 'bullet-angel':
			$username = $response['confirmationFields']['username'];
			break;
                case 'free-fire':
		case 'free-fire-max':
                case 'arena-of-valor':
                case 'call-of-duty-mobile':
			$username = $response['confirmationFields']['roles'][0]['role'];
			break;
                case 'genshin-impact':
                case 'indoplay':
                case 'domino-gaple-qiuqiu-boyaa':
			$username = $response['confirmationFields']['inputRoleId'];
			break;
                        
                default:
			$username = '';
            }
				
		return [
                'result' => true,
                'data' => urldecode($username)
            ];
				
		} else {
			return ['result' => false, 'data' => ['errorCode' => $response['errorCode'], 'errorText' => 'Akun game tidak dapat ditemukan.']];
		}
	}
	
	private function _getVoucherName($game)
	{
		switch($game) {
			case 'mobile-legends':
			case 'lords-mobile':
			case 'marvel-super-war':
			case 'genshin-impact':
			case 'hago':
			case 'point-blank':
			case 'valorant':
			case 'cocofun':
			case 'auto-chess':
			case 'bullet-angel':
				return strtoupper(str_replace('-', '_', $game));
				break;
			case 'higgs-domino':
				return 'HIGGS';
				break;
			case 'dragon-raja':
				return 'ZULONG_DRAGON_RAJA';
				break;
			case 'arena-of-valor':
				return 'AOV';
				break;
			case 'call-of-duty-mobile':
				return 'CALL_OF_DUTY';
				break;
			case 'free-fire':
			case 'free-fire-max':
				return 'FREEFIRE';
				break;
			case 'laplace-m':
				return 'ZLONGAME';
				break;
			case 'ragnarok-m-eternal-love-big-cat-coin':
				return 'GRAVITY_RAGNAROK_M';
				break;
			case 'tom-and-jerry-chase':
				return 'TOM_JERRY_CHASE';
				break;
			case 'speed-drifters':
				return 'SPEEDDRIFTERS';
				break;
			case 'indoplay':
				return 'MANGOSOFT_INDOPLAY';
				break;
			case 'indoplay':
				return 'MANGOSOFT_INDOPLAY';
				break;
			case 'domino-gaple-qiuqiu-boyaa':
				return 'BOYAA_CAPSA_SUSUN';
				break;
			case 'livu':
				return 'RCLOVU';
				break;
			case 'league-of-legends-wild-rift':
				return 'WILD_RIFT';
				break;
			case 'zepeto':
				return 'NAVER_Z_CORPORATION';
				break;
			case '8-ball-pool':
				return 'EIGHT_BALL_POOL';
				break;
				
			default:
				return '';
		}
	}
	
	private function _getDenomination($game)
	{
		$response = $this->_curl('spring/api/graphql', '{"operationName":"GetProductPageInfo","variables":{"productUrl":"/id/' .$game. '","shopLang":""},"query":"query GetProductPageInfo($productUrl: String!, $shopLang: String) {\n  getProductPageInfo(productUrl: $productUrl, shopLang: $shopLang) {\n    gameUserInput {\n      sectionTitle\n      imageHelperUrl\n      instructionText\n      fields {\n        data {\n          text\n          value\n          parentValue\n          __typename\n        }\n        placeHolder\n        type\n        name\n        displayMode\n        displayOnly\n        parentField\n        regexName\n        hasParenthesis\n        hasCountryCode\n        length\n        value\n        __typename\n      }\n      voucherSectionTitle\n      paymentSectionTitle\n      buySectionTitle\n      __typename\n    }\n    productInfo {\n      id\n      gvtId\n      name\n      shortName\n      productTagline\n      shortDescription\n      longDescription\n      metaDescription\n      logoLocation\n      productUrl\n      voucherTypeName\n      orderUrl\n      productTitle\n      variableDenomPriceMinAmount\n      variableDenomPriceMaxAmount\n      __typename\n    }\n    denominations {\n      id\n      voucherId\n      denom\n      displayText\n      pricePoints {\n        id\n        bestdeal\n        paymentChannel {\n          id\n          displayName\n          imageUrl\n          status\n          tagline\n          sortOrder\n          tutorialType\n          tutorialURL\n          statusMessage\n          tutorialLabel\n          __typename\n        }\n        price {\n          currency\n          amount\n          __typename\n        }\n        isVariablePrice\n        __typename\n      }\n      sortOrderId\n      hasStock\n      originalSku\n      status\n      __typename\n    }\n    denominationGroups {\n      displayText\n      displayId\n      pricePoints {\n        id\n        bestdeal\n        paymentChannel {\n          id\n          displayName\n          imageUrl\n          status\n          tagline\n          sortOrder\n          tutorialType\n          tutorialURL\n          statusMessage\n          tutorialLabel\n          isPromotion\n          promotionText\n          infoMessages {\n            icon\n            text\n            __typename\n          }\n          __typename\n        }\n        price {\n          currency\n          amount\n          __typename\n        }\n        isVariablePrice\n        __typename\n      }\n      strikethroughPrice\n      sortOrderId\n      hasStock\n      status\n      isVariableDenom\n      __typename\n    }\n    paymentChannels {\n      id\n      displayName\n      imageUrl\n      status\n      sortOrder\n      isPromotion\n      promotionText\n      buyInputs {\n        label\n        buyInputFields {\n          type\n          required\n          placeHolder\n          minLength\n          maxLength\n          name\n          regexName\n          __typename\n        }\n        __typename\n      }\n      infoMessages {\n        icon\n        text\n        __typename\n      }\n      __typename\n    }\n    faqs {\n      question\n      answer\n      __typename\n    }\n    confirmationDialogSchema {\n      confirmationFields {\n        label\n        value {\n          type\n          field\n          __typename\n        }\n        __typename\n      }\n      invalidUserErrorSchema {\n        errorHeader\n        errorMessage\n        fieldName\n        __typename\n      }\n      __typename\n    }\n    hrefLinks {\n      hrefLang\n      href\n      __typename\n    }\n    cashbackCampaign {\n      campaignId\n      percentage\n      paymentChannelIds\n      skus\n      __typename\n    }\n    __typename\n  }\n}\n"}', 'application/json');
		if(is_array($response)) {
			$result = [];
			
			foreach($response['data']['getProductPageInfo']['denominations'] as $vResponse) {
				if(!empty($result)) {
					break;
				}
				
				foreach($vResponse['pricePoints'] as $vPricePoint) {
					if($vPricePoint['price']['amount'] != '0.0') {
						$result = [
							'pricePointId' => $vPricePoint['id'],
							'pricePointPrice' => $vPricePoint['price']['amount']
						];
						
						break;
					}
				}
			}
			
			return $result;
			
		} else {
			return null;
		}
	}
	
	private function _curl($url, $params, $contentType)
	{
		$ch = curl_init();
		curl_setopt_array($ch, [
			CURLOPT_URL => self::BASE_URL . $url,
			CURLOPT_POST => 1,
			CURLOPT_CUSTOMREQUEST => 'POST',
			CURLOPT_POSTFIELDS => $params,
			CURLOPT_RETURNTRANSFER => 1,
			CURLOPT_HTTPHEADER => [
				"Content-Type: {$contentType}",
				'Accept: application/json',
				'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44'
			]
		]);
		
		$exec = curl_exec($ch);
		curl_close($ch);
		
		return json_decode($exec, true);
	}
}