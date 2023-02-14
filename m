Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0CD3C02
	for <llvm@lists.linux.dev>; Tue, 14 Feb 2023 07:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1676359744; x=1707895744;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fKqsbgGPsuWCWt5qDLOSS1XjcnbLNzAiPOl9OxHQsLM=;
  b=bg5FtFAJ5GAXS34KZsqGJFyoD67vNvUxZ9cmduR2VOKuPCbNlOjjIMhn
   8unxtBvy1ro26chSJuD2loNT4cfJ5ch4GgdT0u1+nZmCPUg35ybjRSMWQ
   SqCO0UHyIApK2LBw7Z17Jp8xT1zoxpcyuHTKIr8UoDmtglGAJAqPLncfe
   qWLsnKzjzV7pKaDAJJ22EjmHsqoVDMARoaigm1AduT3xCCCwV5lMobmlQ
   UNQyEzzSi6EOiin6BtXXDA7rPD1ic8LvmHDpMDmVmbNZ5VYhlLrQcb0ZL
   8yzmRxi/+nx1gWTXtbECy20sSR0T/fyjeO1x76UsCHjL6TiPNgHTD9ekc
   g==;
X-IronPort-AV: E=Sophos;i="5.97,296,1669046400"; 
   d="scan'208";a="327546067"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 14 Feb 2023 15:27:54 +0800
IronPort-SDR: iJVfZBSeAf05JihekD8TF8k+OyxhLhj18ZWit4k3PArpUYDBJfK4GsMDB6c9Ph7n5DWPj0Hgf+
 T+/tcRiWtD6cfA1TM/WSPW5VLGmB3BdCLCqoGou4lPnBtFbf+Q6VkB5SFcDq4YVYsOBvOeu6Rd
 f4IukaxamsOuRjrt+kSSNX7pG2izBibTtk4J9tU+BEwpgoW2FCqNAd3aI50MACSAQ0Xci8hx2n
 tHRj6CNWKSfGACTkdtH4hvRb6BYn3NTDcNlucuowvKs/xg1/olE2BObbv1Nx55M8zxomPzIIJE
 sx8=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Feb 2023 22:45:02 -0800
IronPort-SDR: SHjZjS7QW6Pq+ay++aOIMqJ4w3EWBAGAm357+afdGu9IY9Od8dHL60Uut8nY4V54kO+Dcg4457
 /Ln/DjUrOChLCbrWqfQdSt3L/Yo0JduifA0cd1E/92jsy3Zorw/P1HfE+mRZ5g4FgVTUfR6cWh
 lJxSvoVFw0HMzIxKwtxsHqlKv3OnIaNz9Nk2V+9sR/ruEgaY3zUTilJn1AHNuPQNhPxAWTgFkW
 KEmbLgOADYygGL3edpZoMOhIGfE2GOFAhuaGyTk7grRzbjtx6XfyqClo+mDMXlHp6Ii4Vex7k1
 +oQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Feb 2023 23:27:55 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PGCV22J9cz1Rwtm
	for <llvm@lists.linux.dev>; Mon, 13 Feb 2023 23:27:54 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1676359673; x=1678951674; bh=fKqsbgGPsuWCWt5qDLOSS1XjcnbLNzAiPOl
	9OxHQsLM=; b=qLBsRkuvgw2X455pPBLbc9DStaa/OCukEQXQRY2Wz6jlqoGYX7l
	Dk6XTYLcm5BasJgQgx5GFJBNLLDA6LdTYDBePk8N5yOvIKXXOyy8RhZMLezRyBOz
	MTO2+tSH4IkEPkDd9vt9Sx+lvUwQd/QQTwkc9dBfv1gQCf9tEjnXjndxNltzc7W0
	PcXbBjAJM50oznYEigYII42+YxgwGOuV4QOiolfQRTPmvnXZGbcjfQ1GFTeJ0EPe
	Vla7PL3geXYrSgMwFEoRGwuWQl0b0t+slE71bNkB5EiQd+EJCWsEVRNmSnGs3SCA
	rj/vgeD8DZFlzjPtu9/5bFqgSJ/cf2r015A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id L_JG_nZWHy3S for <llvm@lists.linux.dev>;
	Mon, 13 Feb 2023 23:27:53 -0800 (PST)
Received: from [10.149.53.254] (washi.fujisawa.hgst.com [10.149.53.254])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PGCTz3h31z1RvLy;
	Mon, 13 Feb 2023 23:27:51 -0800 (PST)
Message-ID: <9b335f88-a20a-83da-3ce1-df409e05004a@opensource.wdc.com>
Date: Tue, 14 Feb 2023 16:27:50 +0900
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] scsi: ipr: work around fortify-string warning
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
 Brian King <brking@us.ibm.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20230213101143.3821483-1-arnd@kernel.org>
 <3d94fc3f-fbe5-a56e-3713-4f0788ebc7f9@opensource.wdc.com>
 <94b362b4-a30d-4b69-8126-a64f5d025740@app.fastmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <94b362b4-a30d-4b69-8126-a64f5d025740@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/14/23 16:14, Arnd Bergmann wrote:
> On Tue, Feb 14, 2023, at 04:59, Damien Le Moal wrote:
>> On 2/13/23 19:10, Arnd Bergmann wrote:
>>> From: Arnd Bergmann <arnd@arndb.de>
> 
>>>   **/
>>> -static int strip_and_pad_whitespace(int i, char *buf)
>>> +static void strip_whitespace(int i, char *buf)
>>>  {
>>>  	while (i && buf[i] == ' ')
>>>  		i--;
>>> -	buf[i+1] = ' ';
>>> -	buf[i+2] = '\0';
>>> -	return i + 2;
>>> +	buf[i+1] = '\0';
>>
>> If i is now the size of the buffer, this is a buffer overflow, no ? And
>> the initial loop should start at "i - 1" I think...
> 
> Right, I definitely have the wrong length here.
> 
>>>  }
>>>  
>>>  /**
>>> @@ -1547,19 +1543,21 @@ static int strip_and_pad_whitespace(int i, char *buf)
>>>  static void ipr_log_vpd_compact(char *prefix, struct ipr_hostrcb *hostrcb,
>>>  				struct ipr_vpd *vpd)
>>>  {
>>> -	char buffer[IPR_VENDOR_ID_LEN + IPR_PROD_ID_LEN + IPR_SERIAL_NUM_LEN + 3];
>>> -	int i = 0;
>>> +	char vendor_id[IPR_VENDOR_ID_LEN + 1];
>>
>> ...but the size is in fact "i + 1"... So in strip_whitespace(), i is the
>> index of the last possible character in the string, and given that the
>> string may be much shorter, that function may not actually strip
>> whitespaces after the string...
> 
> I think aside from the off-by-one bug I introduced, this is not
> a (new) problem as the old code already assumed that the input
> is padded with spaces rather than nul-terminated.

Yeah. The HW probably always give the same amount of chars with short
strings completed by spaces...

> 
>>> +	char product_id[IPR_PROD_ID_LEN + 1];
>>> +	char sn[IPR_SERIAL_NUM_LEN + 1];
>>>  
>>> -	memcpy(buffer, vpd->vpids.vendor_id, IPR_VENDOR_ID_LEN);
>>> -	i = strip_and_pad_whitespace(IPR_VENDOR_ID_LEN - 1, buffer);
>>> +	memcpy(vendor_id, vpd->vpids.vendor_id, IPR_VENDOR_ID_LEN);
>>> +	strip_whitespace(IPR_VENDOR_ID_LEN, vendor_id);
>>
>> So this call should really be:
>>
>> 	strip_whitespace(strlen(vendor_id) - 1, vendor_id);
>>
>> Which means that this helper can be turned into:
>>
>> static void strip_whitespace(char *buf)
>> {
>> 	int i = strlen(buf) - 1;
>>
>> 	while (i > 0 && buf[i] == ' ')
>> 		i--;
>> 	buf[i+1] = '\0';
>> }
>>
>> Unless I am missing something :)
> 
> The strlen() here requires the input to be a properly terminated string,
> so this would at least require adding a \0.
> 
> Also, if the input is a short nul-terminated string instead of
> a space padded array, we probably don't need to strip the trailing
> whitespace, or at least the original version didn't either.
> 
> Let me try to respin my patch with just the off-by-one error
> fixed but otherwise keeping the output of ipr_log_vpd_compact()
> unchanged.
> 
>       Arnd

-- 
Damien Le Moal
Western Digital Research

