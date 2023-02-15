Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308DD193
	for <llvm@lists.linux.dev>; Wed, 15 Feb 2023 04:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1676436257; x=1707972257;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rllAuMPvoBr0L1lHfSbaKvi2l3urZy0SiU0ZdfBD6O0=;
  b=Z1A0rUizC7yKfd2ft1PyKWnPSx32osaAdt1RvHavDkhTIMphejbZFPny
   xXcJB1KXr0nzABDwVkHKWjtFqtDvXiZWplSZAJiJxqRgLya+bwLN5xVlp
   9Z4ShgawYkeO09TOdugrsW1KMpRjR0jZ4zK29LQqDZfu1WWNjhcbn7yfU
   ROAa6TvRgjErKJJ+IwSRYPNJ88Scfn8T0R0FEuWDbVm1yFv5DRU6JyCVm
   5+gXtwoFS1s5oWfHDdWkJ4Tq03Vfan+ACcjITRSk808ICOe9jz06Xa7OP
   +ndVCq6itQC841tf2PXq1Iwu9ijnGCdp2ZObGyRQdy2NAfPA0bTpckRuw
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,298,1669046400"; 
   d="scan'208";a="223129912"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 15 Feb 2023 12:43:05 +0800
IronPort-SDR: r+tT8S4WtajCI2SJYoTZ0Oh3xmsUVlTd9ByBsctmOdr9ExL9FE+bn5JpYEErkmWl69pb8GpGFI
 Oicuxqlns9cWRArb7p4V7Cnqc3K686J5tP7uGkRRdu4VdUyssNyVE8SD37QnaQnv0PY0ojaMyR
 F6hzLEKtuQINPX0qV+nAcSUqGLDhbZ0f0yzsOQPp+9hPOoJc5zp2pHBemVr+pt7JHd0TNjJBrG
 tKDeCI6YrqDqXKjqJk8pCusQcONjFbLnHETRfQE+px9xYy813zga9/qEVPpMqCcVO0JDjjfEXA
 0FM=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Feb 2023 19:54:26 -0800
IronPort-SDR: q0h6dvpA/9nq9IZsPINnhb/a57DpIjlIcqHHhFd9jpFp7fmiZPO1WArsB5iIwiAZMz5TMSmeDj
 cELBviZT4/XzwI2M7RQa3wzdJ6apxI+CuNGUOpdCciVWBUMyqKd62ZVlWhcpUagPHOSh723LYQ
 zRq0brhyUwICcn0vUoGtLM5teKTpCveUxKkM6xKujSaD97krnEEBxqOuKrOszNPiZaDDUdFEIr
 5s0EuGr5U2E1oLY3oCUSzHK76vxR2HUxvz7XbdSMiNidWXlOC+Dvsf9o1a/8Dtjmua7DeML1bz
 AJY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Feb 2023 20:43:04 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PGlnM26gVz1Rwtm
	for <llvm@lists.linux.dev>; Tue, 14 Feb 2023 20:43:03 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1676436182; x=1679028183; bh=rllAuMPvoBr0L1lHfSbaKvi2l3urZy0SiU0
	ZdfBD6O0=; b=dHQcYyajSSXM3vLe5O/aieZcOGHfjTcjzMVab0z7BQxFXU3AFt7
	iBcfAg5kHGp/5Re1Suib2SfpNsfA4/wXnNbUEeMf+xcGJRae9VnnWCpttZnYHcJA
	iF3CnB2ioq64V9Zsb88hVrkAUeWavmELQzeY9PylCte00lyxUXOiO0XvDYoSZtJA
	KCML8nF4cHwSngLEW5vuVrKsFCakIfeQq3Df1QAEUBnZ/TL2faF2sIS0F05PGV79
	ia3cjxFss3JRqxvvKkElS7ooNpl9zzv1ldvSZrBzqdPflMvhbUxhK9P+vF0YOkYB
	SAeE0lIHOkiyeoYDOEqfDTBIGGrBL7qYxUA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id X6L2YSsiivV8 for <llvm@lists.linux.dev>;
	Tue, 14 Feb 2023 20:43:02 -0800 (PST)
Received: from [10.225.163.116] (unknown [10.225.163.116])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PGlnJ0CZsz1RvLy;
	Tue, 14 Feb 2023 20:42:59 -0800 (PST)
Message-ID: <63b3aeca-d219-264c-c944-eb4e85f36f9f@opensource.wdc.com>
Date: Wed, 15 Feb 2023 13:42:58 +0900
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] [v2] scsi: ipr: work around fortify-string warning
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Brian King <brking@us.ibm.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 James Bottomley <James.Bottomley@SteelEye.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>,
 Niklas Cassel <niklas.cassel@wdc.com>, John Garry <john.g.garry@oracle.com>,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20230214132831.2118392-1-arnd@kernel.org>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20230214132831.2118392-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/14/23 22:28, Arnd Bergmann wrote:
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

Looks good to me.

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

