Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC31279DB7;
	Fri, 16 Jan 2026 13:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.157.23.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768571171; cv=none; b=AkJC2vW1fpTgAYDyRhifwkyD3wAV22CWyuWExatR9zVfrACR3C0LWnc/K7xHZk4x5zO750hnUEMIyoavEQDEtXPs03Qg+spTyUNmrwQzuVwKpMZBfmJGVMGaxNJ1IcCcMlZbO3FHeKgkRkw4jRiOFBuSnStprtfMqYDHLPbYl+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768571171; c=relaxed/simple;
	bh=b7VpUDOBbSfC/kAC+9rZlKKP2cRQlN4pJt00MKGkFhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VYhujc/tcYfBNhO0X79XenQyKZggOe5LEB9+5nd3JKxQu+jSpUVnvs49dVAsdiVlEqK+CROeMHNkzINHQc1pSZEJr0xZEJ3I9SAJkpLxLI87Bpl7J7BpR5c1i7Bipjx2ErNaOrP7d8hEIpR5pmBUdsLPRMGUuw1y+EJqeZYEuZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com; spf=pass smtp.mailfrom=paragon-software.com; dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b=oADOlYX3; arc=none smtp.client-ip=35.157.23.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paragon-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=paragon-software.com header.i=@paragon-software.com header.b="oADOlYX3"
Received: from relayfre-01.paragon-software.com (unknown [176.12.100.13])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 0A3AF1D99;
	Fri, 16 Jan 2026 13:43:30 +0000 (UTC)
Authentication-Results: relayaws-01.paragon-software.com;
	dkim=pass (1024-bit key; unprotected) header.d=paragon-software.com header.i=@paragon-software.com header.b=oADOlYX3;
	dkim-atps=neutral
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayfre-01.paragon-software.com (Postfix) with ESMTPS id 49F1C219B;
	Fri, 16 Jan 2026 13:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1768571168;
	bh=4J4bQuWC5OYHsWEt03Ct86XA3IwMpXOKBlyQyHn0itA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=oADOlYX33cnxxLtAJQHdeOfElQm933i3Y1EXmzXmC3QG0VcHLi/S+BDvt3dgU2PSB
	 /p9gF8f2HDbFLxm2Sju2oRWSWeWs7rUBcT4E8BM9BiYdRp/3hQqjcieD8Tbg9B9fFW
	 R52JIHAqsanlpiKzMx//a2WD89DCc9O+lmR1W5Mc=
Received: from [192.168.95.128] (172.30.20.155) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 16 Jan 2026 16:46:07 +0300
Message-ID: <104e68d7-9b50-4318-ae64-8a22093c6e92@paragon-software.com>
Date: Fri, 16 Jan 2026 14:46:06 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ntfs3: Restore NULL folio initialization in
 ntfs_writepages()
To: Nathan Chancellor <nathan@kernel.org>
CC: <ntfs3@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>, kernel test robot <lkp@intel.com>
References: <20260105-ntfs3-restore-null-folio-init-v1-1-432093703dfd@kernel.org>
Content-Language: en-US
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20260105-ntfs3-restore-null-folio-init-v1-1-432093703dfd@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)

On 1/5/26 20:17, Nathan Chancellor wrote:

> Clang warns (or errors with CONFIG_WERROR=y):
>
>    fs/ntfs3/inode.c:1021:6: error: variable 'folio' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
>     1021 |         if (is_resident(ni)) {
>          |             ^~~~~~~~~~~~~~~
>    fs/ntfs3/inode.c:1024:48: note: uninitialized use occurs here
>     1024 |                 while ((folio = writeback_iter(mapping, wbc, folio, &err)))
>          |                                                              ^~~~~
>
> folio should be initialized to NULL for the first iteration of
> writeback_iter() to start the loop properly. Restore the NULL
> initialization of folio that was lost in the recent iomap conversion to
> clear up the warning.
>
> Fixes: 099ef9ab9203 ("fs/ntfs3: implement iomap-based file operations")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601010644.FIhOXy6Y-lkp@intel.com/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>   fs/ntfs3/inode.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
> index b969ad7c3258..438d468f28ba 100644
> --- a/fs/ntfs3/inode.c
> +++ b/fs/ntfs3/inode.c
> @@ -1019,7 +1019,7 @@ static int ntfs_writepages(struct address_space *mapping,
>   		return -EIO;
>   
>   	if (is_resident(ni)) {
> -		struct folio *folio;
> +		struct folio *folio = NULL;
>   
>   		while ((folio = writeback_iter(mapping, wbc, folio, &err)))
>   			err = ntfs_resident_writepage(folio, wbc);
>
> ---
> base-commit: 099ef9ab9203dff327f2d61e44773f9acbc01f13
> change-id: 20260105-ntfs3-restore-null-folio-init-e3d7a7d6dd01
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>

Queued for the next merge window, thanks.

Regards,
Konstantin

