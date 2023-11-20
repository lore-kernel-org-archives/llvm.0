Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 22289111BA
	for <llvm@lists.linux.dev>; Mon, 20 Nov 2023 09:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [172.30.11.106] (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 9E0EA633B0343;
	Mon, 20 Nov 2023 17:28:30 +0800 (CST)
Message-ID: <5c98fc07-36a9-92cc-f8d6-c4efdc0c34aa@nfschina.com>
Date: Mon, 20 Nov 2023 17:28:30 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] misc: mei: client.c: fix some error code problem in
 mei_cl_write
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: tomas.winkler@intel.com, arnd@arndb.de, nathan@kernel.org,
 ndesaulniers@google.com, trix@redhat.com, alexander.usyskin@intel.com,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 kernel-janitors@vger.kernel.org
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <2023112010-ceremony-salad-145b@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2023/11/20 17:14, Greg KH wrote:
> On Mon, Nov 20, 2023 at 04:53:45PM +0800, Su Hui wrote:
>> Clang static analyzer complains that value stored to 'rets' is never
>> read. Remove some useless code, and let 'buf_len = -EOVERFLOW' to make
>> sure we can return '-EOVERFLOW'.
>>
>> mei_msg_hdr_init() return negative error code, rets should be
>> 'PTR_ERR(mei_hdr)' rather than '-PTR_ERR(mei_hdr)'.
>>
>> Fixes: 0cd7c01a60f8 ("mei: add support for mei extended header.")
>> Fixes: 8c8d964ce90f ("mei: move hbuf_depth from the mei device to the hw modules")
>> Signed-off-by: Su Hui <suhui@nfschina.com>
>> ---
>>   drivers/misc/mei/client.c | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/misc/mei/client.c b/drivers/misc/mei/client.c
>> index 9c8fc87938a7..00dac0a47da0 100644
>> --- a/drivers/misc/mei/client.c
>> +++ b/drivers/misc/mei/client.c
>> @@ -2011,7 +2011,7 @@ ssize_t mei_cl_write(struct mei_cl *cl, struct mei_cl_cb *cb, unsigned long time
>>   
>>   	mei_hdr = mei_msg_hdr_init(cb);
>>   	if (IS_ERR(mei_hdr)) {
>> -		rets = -PTR_ERR(mei_hdr);
>> +		rets = PTR_ERR(mei_hdr);
> This looks like a bugfix, while the other changes here are just a normal
> cleanup.  Can you please split this up into different patches?
I will split this right now.
Thanks for your suggestion!

Su Hui

>
> thanks,
>
> greg k-h
