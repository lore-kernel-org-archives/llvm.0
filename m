Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id E1A2E4407
	for <llvm@lists.linux.dev>; Thu, 23 Nov 2023 01:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [172.30.11.106] (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 93A156027E065;
	Thu, 23 Nov 2023 09:34:58 +0800 (CST)
Message-ID: <79634dda-fd3b-5a93-9435-d0a1474b847f@nfschina.com>
Date: Thu, 23 Nov 2023 09:34:57 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH wireless-next 2/2] rtlwifi: rtl8821ae: phy: fix an
 undefined bitwise shift behavior
Content-Language: en-US
To: Ping-Ke Shih <pkshih@realtek.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: "kvalo@kernel.org" <kvalo@kernel.org>,
 "nathan@kernel.org" <nathan@kernel.org>,
 "ndesaulniers@google.com" <ndesaulniers@google.com>,
 "trix@redhat.com" <trix@redhat.com>,
 "lizetao1@huawei.com" <lizetao1@huawei.com>,
 "linville@tuxdriver.com" <linville@tuxdriver.com>,
 "Larry.Finger@lwfinger.net" <Larry.Finger@lwfinger.net>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <99ec66d717b249e781f9316cbd689521@realtek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/11/23 08:41, Ping-Ke Shih wrote:
>
>> -----Original Message-----
>> From: Dan Carpenter <dan.carpenter@linaro.org>
>> Sent: Wednesday, November 22, 2023 9:02 PM
>> To: Su Hui <suhui@nfschina.com>
>> Cc: Ping-Ke Shih <pkshih@realtek.com>; kvalo@kernel.org; nathan@kernel.org; ndesaulniers@google.com;
>> trix@redhat.com; lizetao1@huawei.com; linville@tuxdriver.com; Larry.Finger@lwfinger.net;
>> linux-wireless@vger.kernel.org; linux-kernel@vger.kernel.org; llvm@lists.linux.dev;
>> kernel-janitors@vger.kernel.org
>> Subject: Re: [PATCH wireless-next 2/2] rtlwifi: rtl8821ae: phy: fix an undefined bitwise shift behavior
>>
>> Perhaps, a better way to silence the warning is to just change
>> _rtl8821ae_phy_calculate_bit_shift() to not return 32 bits?  Do we
>> really ever pass bitmask 0?  No idea...
>>
> I think the bitmask should not 0, so just replace _rtl8821ae_phy_calculate_bit_shift()
> by __ffs(bitmask). To be safer, callers can check bitmask is not 0 before calling.
Thanks for your great suggestion!
I will send v2 soon.

Su Hui

