Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1319D23D5
	for <llvm@lists.linux.dev>; Tue, 14 Feb 2023 04:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1676347250; x=1707883250;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=puEmpB7TX9cmSCrEtb6a06wvTDoatGPLAyrjZN6yjlQ=;
  b=fxnD5dTmG1yVB05BpuXTQ5QEADH0rZBffwNk6QXn61LJWwrx8AfItNTD
   fnAyhlnCyrPLOACjcdWdqSRaUf7X+V/+g2rHKt45PZxclIyHcn31tmOm+
   8glz0ZqSKe3UyKD+0g0ofY0v7KqbscDvkmmDff27dWJvDcxTkoiDk80vw
   H/oKB7/F1uBdwxKZ4IUeuvoVBR/O8CbiqJhAiaM6SoO5/g/bPzYA5kVlS
   FKdc6s/0ZIWfGpcsRtaLh1+pj51sAYQcUfVUalVmZ+ywNyafm651d3VDz
   f3uviYdu51ow6ix9dFaLqmstMbo06PPzBQ1QYLa5Q8SKx5IctEHJDcF7Q
   g==;
X-IronPort-AV: E=Sophos;i="5.97,294,1669046400"; 
   d="scan'208";a="335203283"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 14 Feb 2023 11:59:42 +0800
IronPort-SDR: QXeOY5Rcpq4aJA/zzSoBEaDv4z/hvn1DTMziOvvUdoKNXnuyz0AtJ8Zha5eD8z18BILI50rZVy
 qbLiG1MsE2HxtJsdbKab3xhFIQX+TeiIPIHwb3AE85hTW4SPFeqKnLiFRQLArNBoP7Dssyw04T
 ChZVMzgQy4ty5QVVOdvLipvw0DpEvi0bDv+zSu6bcvqvTH/bwon0b70ZQB15FHpB6ylTfYMpvO
 M5lINtKAcd2jRcoAWGPOUQHo5t4jZVVohiMOnBcEfl0ek7nhPgKtgvJu5GwI+mCusnJCnqRd3r
 0vc=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Feb 2023 19:16:50 -0800
IronPort-SDR: qVipSvQ4plHRgagtEuXajPwOQjDjtUOyajAGMIV5fApqdAuuHGV+8x5uGNi4FtEBkwbuinxv7h
 NxDy1NjMXhbh3dng8KDPwppp7WyD1iyTWkKCsLiM+fAJpX2IOTfq1oX7woe1gWYGjGdh73U6uc
 UhRxCbqOZcf4U/59zsw7HhJ/CfbvTvV9C3zrpWmEWsX1HdNHLKGz4NH8g5/95pBduVhw/gEm0F
 9LB59ciFaw22a9fLIF8ffdjqqn5fxw3diAOCjX4Fz9t6H8joWM2XitmhNrHtvPTEA6YncEKoQ/
 AZM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Feb 2023 19:59:42 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PG6sn6LK9z1RvTr
	for <llvm@lists.linux.dev>; Mon, 13 Feb 2023 19:59:41 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1676347180; x=1678939181; bh=puEmpB7TX9cmSCrEtb6a06wvTDoatGPLAyr
	jZN6yjlQ=; b=S0+ePlRHLReSz8TjXAQ2nFh4biOunvotoPtKS1TWLiuYO0sH5T1
	UdWLIrfCLmp8z8JsTU7Vjn/K9D7SFmhXgz4Qyx3Aqm54O8Eqnj3zW6xdxVM1q6Jf
	YJUnZ4E2dKXl5bebY5Bd1ywU6woKLQsRmaoeecI4QAUdV/ybrXlLPVTJAz/JGgQb
	VHVYaueRPSovL5Rxw5eu/2xdFBdw9L08AsOaGLXsCYt3+kFAjlQPF6LoIVnE5WXv
	tf+Olt/dRXpvSlvOwb0UwCYoM8RFWbm4aVVChRBrM+OttyJqGC8NMLMEbNT9cxiv
	w19zaexGmU+v9PvPH3n90DWFH3iOQzHoodA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id FndIMVxiYRft for <llvm@lists.linux.dev>;
	Mon, 13 Feb 2023 19:59:40 -0800 (PST)
Received: from [10.149.53.254] (washi.fujisawa.hgst.com [10.149.53.254])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PG6sl0PxDz1RvLy;
	Mon, 13 Feb 2023 19:59:38 -0800 (PST)
Message-ID: <3d94fc3f-fbe5-a56e-3713-4f0788ebc7f9@opensource.wdc.com>
Date: Tue, 14 Feb 2023 12:59:37 +0900
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
To: Arnd Bergmann <arnd@kernel.org>, Brian King <brking@us.ibm.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20230213101143.3821483-1-arnd@kernel.org>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20230213101143.3821483-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/13/23 19:10, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The ipr_log_vpd_compact() function triggers a fortified memcpy() warning
> about a potential string overflow with all versions of clang:
> 
> In file included from drivers/scsi/ipr.c:43:
> In file included from include/linux/string.h:254:
> include/linux/fortify-string.h:520:4: error: call to '__write_overflow_field' declared with 'warning' attribute: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
>                         __write_overflow_field(p_size_field, size);
>                         ^
> include/linux/fortify-string.h:520:4: error: call to '__write_overflow_field' declared with 'warning' attribute: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
> 2 errors generated.
> 
> I don't see anything actually wrong with the function, but this is the
> only instance I can reproduce of the fortification going wrong in the
> kernel at the moment, so the easiest solution may be to rewrite the
> function into something that does not trigger the warning.
> 
> Instead of having a combined buffer for vendor/device/serial strings,
> use three separate local variables and just truncate the whitespace
> individually.
> 
> Fixes: 8cf093e275d0 ("[SCSI] ipr: Improved dual adapter errors")
> Cc: Kees Cook <keescook@chromium.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I did not try to bisect which commit introduced this behavior into
> the fortified memcpy(), the Fixes: commit is the one that introduced
> the ipr_log_vpd_compact() function but this predates the fortified
> string helpers.
> ---
>  drivers/scsi/ipr.c | 38 ++++++++++++++++++--------------------
>  1 file changed, 18 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/scsi/ipr.c b/drivers/scsi/ipr.c
> index 198d3f20d682..490fd81e7cfd 100644
> --- a/drivers/scsi/ipr.c
> +++ b/drivers/scsi/ipr.c
> @@ -1516,23 +1516,19 @@ static void ipr_process_ccn(struct ipr_cmnd *ipr_cmd)
>  }
>  
>  /**
> - * strip_and_pad_whitespace - Strip and pad trailing whitespace.
> - * @i:		index into buffer
> - * @buf:		string to modify
> + * strip_whitespace - Strip and pad trailing whitespace.
> + * @i:		size of buffer
> + * @buf:	string to modify
>   *
> - * This function will strip all trailing whitespace, pad the end
> - * of the string with a single space, and NULL terminate the string.
> + * This function will strip all trailing whitespace and
> + * NUL terminate the string.
>   *
> - * Return value:
> - * 	new length of string
>   **/
> -static int strip_and_pad_whitespace(int i, char *buf)
> +static void strip_whitespace(int i, char *buf)
>  {
>  	while (i && buf[i] == ' ')
>  		i--;
> -	buf[i+1] = ' ';
> -	buf[i+2] = '\0';
> -	return i + 2;
> +	buf[i+1] = '\0';

If i is now the size of the buffer, this is a buffer overflow, no ? And
the initial loop should start at "i - 1" I think...

>  }
>  
>  /**
> @@ -1547,19 +1543,21 @@ static int strip_and_pad_whitespace(int i, char *buf)
>  static void ipr_log_vpd_compact(char *prefix, struct ipr_hostrcb *hostrcb,
>  				struct ipr_vpd *vpd)
>  {
> -	char buffer[IPR_VENDOR_ID_LEN + IPR_PROD_ID_LEN + IPR_SERIAL_NUM_LEN + 3];
> -	int i = 0;
> +	char vendor_id[IPR_VENDOR_ID_LEN + 1];

...but the size is in fact "i + 1"... So in strip_whitespace(), i is the
index of the last possible character in the string, and given that the
string may be much shorter, that function may not actually strip
whitespaces after the string...

> +	char product_id[IPR_PROD_ID_LEN + 1];
> +	char sn[IPR_SERIAL_NUM_LEN + 1];
>  
> -	memcpy(buffer, vpd->vpids.vendor_id, IPR_VENDOR_ID_LEN);
> -	i = strip_and_pad_whitespace(IPR_VENDOR_ID_LEN - 1, buffer);
> +	memcpy(vendor_id, vpd->vpids.vendor_id, IPR_VENDOR_ID_LEN);
> +	strip_whitespace(IPR_VENDOR_ID_LEN, vendor_id);

So this call should really be:

	strip_whitespace(strlen(vendor_id) - 1, vendor_id);

Which means that this helper can be turned into:

static void strip_whitespace(char *buf)
{
	int i = strlen(buf) - 1;

	while (i > 0 && buf[i] == ' ')
		i--;
	buf[i+1] = '\0';
}

Unless I am missing something :)
>  
> -	memcpy(&buffer[i], vpd->vpids.product_id, IPR_PROD_ID_LEN);
> -	i = strip_and_pad_whitespace(i + IPR_PROD_ID_LEN - 1, buffer);
> +	memcpy(product_id, vpd->vpids.product_id, IPR_PROD_ID_LEN);
> +	strip_whitespace(IPR_PROD_ID_LEN, product_id);
>  
> -	memcpy(&buffer[i], vpd->sn, IPR_SERIAL_NUM_LEN);
> -	buffer[IPR_SERIAL_NUM_LEN + i] = '\0';
> +	memcpy(sn, vpd->sn, IPR_SERIAL_NUM_LEN);
> +	strip_whitespace(IPR_SERIAL_NUM_LEN, sn);
>  
> -	ipr_hcam_err(hostrcb, "%s VPID/SN: %s\n", prefix, buffer);
> +	ipr_hcam_err(hostrcb, "%s VPID/SN: %s %s %s\n", prefix,
> +		     vendor_id, product_id, sn);
>  }
>  
>  /**

-- 
Damien Le Moal
Western Digital Research

