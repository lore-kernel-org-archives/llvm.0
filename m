Received: from relayaws-01.paragon-software.com (relayaws-01.paragon-software.com [35.157.23.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A60E7B;
	Wed,  8 Jun 2022 15:28:55 +0000 (UTC)
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
	by relayaws-01.paragon-software.com (Postfix) with ESMTPS id 5B3571D78;
	Wed,  8 Jun 2022 15:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paragon-software.com; s=mail; t=1654702092;
	bh=ZIn5ncpNxC8T/c1MmFgaJnj+dvlJ1abmWAeW+JUsdto=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=LR5mbVmS7J/+r4oKJTo8vi0yNSt3z7ohVTUkK53WvHvhgMWK6Pyg9x242XSGZqjw4
	 XnsuqNMogYV39PIzaZbyckB10YgqySZwAZ0fHIJklBU9CW+qzLCxiL5rfl54uIbcAC
	 4Qj5/0mVa1X2T/KvR22/1XSg75E19KieKc/3jX5E=
Received: from [172.30.8.65] (172.30.8.65) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 8 Jun 2022 18:28:49 +0300
Message-ID: <d8ff3d09-ac85-da53-c638-30135c9eb6c2@paragon-software.com>
Date: Wed, 8 Jun 2022 18:28:49 +0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] fs/ntfs3: remove redundant assignment to variable vcn
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>, <ntfs3@lists.linux.dev>
CC: <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>
References: <20220418140038.82843-1-colin.i.king@gmail.com>
From: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20220418140038.82843-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.30.8.65]
X-ClientProxiedBy: vdlg-exch-02.paragon-software.com (172.30.1.105) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)



On 4/18/22 17:00, Colin Ian King wrote:
> Variable vcn is being assigned a value that is never read, it is
> being re-assigned again in the initialization of a for-loop.  The
> assignment is redundant and can be removed.
> 
> Cleans up clang scan build warning:
> fs/ntfs3/attrib.c:1176:7: warning: Value stored to 'vcn' during its
> initialization is never read [deadcode.DeadStores]
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   fs/ntfs3/attrib.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
> index e8c00dda42ad..fc0623b029e6 100644
> --- a/fs/ntfs3/attrib.c
> +++ b/fs/ntfs3/attrib.c
> @@ -1173,7 +1173,7 @@ int attr_load_runs_range(struct ntfs_inode *ni, enum ATTR_TYPE type,
>   {
>   	struct ntfs_sb_info *sbi = ni->mi.sbi;
>   	u8 cluster_bits = sbi->cluster_bits;
> -	CLST vcn = from >> cluster_bits;
> +	CLST vcn;
>   	CLST vcn_last = (to - 1) >> cluster_bits;
>   	CLST lcn, clen;
>   	int err;

Thanks for patch, applied!
