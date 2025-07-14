Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EC2257AF2
	for <llvm@lists.linux.dev>; Mon, 14 Jul 2025 14:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752503831; cv=none; b=LtE558ljXeiZswLM/CCHJFymPuGXJyYGzpw0K8AxPofVx90fdrTJ9jDPgBO9e23xczSYuJdpVFj6vgIiT06XKosRyfWphvE7v0Ch12BCVQeNUEP7z0smaa3FzA/9wGWYplZinAEa5Gmg/Nx0/myyLSDe/VJEkAOlmNrN/7MCKmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752503831; c=relaxed/simple;
	bh=jfkbhYru0bFIk2VctfQAth663ehySmtvE2nRp1sPZ+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IX/uihkewa0TVYSDa+wTlMxG2Uhsrvov+DAi6+que9bWeJFoS30TAoyaHRLdWdwmJQ0Le9XTyvjZlfW9fBfYPa6GDeUnEWVraeH09fCYc8Gp7+V2ixye6SDt+fJqCbLRDuHlXDG9FVr4lKxZtG+vSJQh0DSiWgwavLyMRaiYub8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=eA6+B3/W; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="eA6+B3/W"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-7048c49f1f1so36076726d6.0
        for <llvm@lists.linux.dev>; Mon, 14 Jul 2025 07:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1752503828; x=1753108628; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XyTDdbiheRnKMGdgHLnRikk86cXTsPCJomYNsFHd9a0=;
        b=eA6+B3/WTW3zQtcimKDxCl+/PRvmRqGgn8tzJ31d07mBCkzDYsQUR/eFLlixH/zmKf
         HgXOgoJrI5mB06bPHzaoYW9e7JoPBgBMCzG4tY34uoNh6sECwVKWLBpB9seIOa5xoZIV
         /pZ+ZV+eepx6IJaMuwvk2QYFym7xMlupSZ4LFZh2gceTm0hUCmONOvntEOrFZQPaoJf5
         /UAEr10z27WpcDUgVVu18Y3F4FVFosYQGFv/atGUnDfaFEOM8F78P9LdA4c34ll54bub
         wa8danV6qgKx5oCjFDMCVTtWajOAWkac0Oh7nPEddC/Lpu1LwL4an6L1mIQBPkYDUzTh
         fI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752503828; x=1753108628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XyTDdbiheRnKMGdgHLnRikk86cXTsPCJomYNsFHd9a0=;
        b=u8g6M+MA5VZUZTr4ZzdLmccwuPMV/T3TMy1z9q+PCU2JTmamR0KTV51zSvGRKMvEJR
         vArm9CxaFlxjZBOkUHsI6QXZ3y56xdAYGQiQ4hyh84PA2AW0zS2D9Sq8/kSULWilUs0r
         SUniABnMSVZDbXij/KMvGrH2+mrINZmeKIlmiZyZbEiZNGLXQvcLqtWVh9Up/pRYBXxC
         jZ8+mIMOKYfFch1QQ2qxAcLloEaiuWSol9fgoQg4imaONhphmt82VhL6+gfYvmsiif4d
         cJfEgqaTD2Oy3Ww5EJXOEloC67oDrFBaJWKMrUE6xaWslfsjREheEOk6iLUoyjjv76mO
         MdYA==
X-Forwarded-Encrypted: i=1; AJvYcCUR/7Qg9ZlZBPHuVutl22qy10PkMlLkkUe1ZcSRQGsCYufzk3jRi4YQKiAdfdMzy2Ac6W8U@lists.linux.dev
X-Gm-Message-State: AOJu0YxklsJOIcioxUalDN35oSrQ5tT6mCa3umlf/vVrRU1jQDm2IyHy
	C5vBJ0sUvVfkTRbObeIFF4aTSBVvabZOWMamGdnSEJpXOMTZ/s0ScUuiOqdwbFK+K3p5gc9dCGW
	Ey2bx
X-Gm-Gg: ASbGncs3NKR7JXKC3AFlNClYtrXNdMWsflFpDZKO7rnsedZm1u6iLMzJXVScXMCNks8
	1J8Fcwc9o0fcgdKNj9U9V4+0FqiesFvW/q/afo+pXtYUyp2LmOqjN7JwHJbRO64ybqCM/NbvSgl
	btWZjpBYp64NzYaziNN6beGHR7sZxnLn4qvmgHrjCWvHRQWOCik4WSl3WYtS9ktCUwbzn7ZJ2sG
	DBkL+1ur9Q/MxAmRNpnTyKtY94NiZ58rifDHqAjXRZp2LdTUYfneC0i1nAWRrJwU7NVD4sewJZb
	0eiOaRyP0N9cg5gHsc6Xpe9ghhI4kqi1w1nkzT0weJl/X48r173ih6gOL/2AVuixTFrwL5i+yyO
	lqQYIG/JXUNycIespu78i861HSaqovRDGETf4qi0qsTVHLgDE+pclWWaMCpSrW93z35B+gmqp+Q
	==
X-Google-Smtp-Source: AGHT+IGzSh4U8zlkbAbt1sARjalYvKWSIgZ8I6Ou+Sz022y53ECOehZLFJYmOuZw9cPfaOr9xiWGcA==
X-Received: by 2002:a05:6214:258f:b0:6fa:d956:243b with SMTP id 6a1803df08f44-704a39bb51dmr231977926d6.37.1752503827724;
        Mon, 14 Jul 2025 07:37:07 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497dae711sm47567726d6.100.2025.07.14.07.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 07:37:06 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1ubKIj-00000008fud-3bh6;
	Mon, 14 Jul 2025 11:37:05 -0300
Date: Mon, 14 Jul 2025 11:37:05 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Leon Romanovsky <leon@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	=?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v1 1/1] locking/lockdep: Move pmd_to_hmm_pfn_flags() to
 the respective #ifdeffery
Message-ID: <20250714143705.GG1870174@ziepe.ca>
References: <20250710082257.663850-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710082257.663850-1-andriy.shevchenko@linux.intel.com>

On Thu, Jul 10, 2025 at 11:22:57AM +0300, Andy Shevchenko wrote:
> When pmd_to_hmm_pfn_flags() is unused, it prevents kernel builds with clang,
> `make W=1` and CONFIG_TRANSPARENT_HUGEPAGE=n:
> 
>   mm/hmm.c:186:29: warning: unused function 'pmd_to_hmm_pfn_flags' [-Wunused-function]
> 
> Fix this by moving the function to the respective existing ifdeffery
> for its the only user.
> 
> See also:
> 
>   6863f5643dd7 ("kbuild: allow Clang to find unused static inline functions for W=1 build")
> 
> Fixes: 9d3973d60f0a ("mm/hmm: cleanup the hmm_vma_handle_pmd stub")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  mm/hmm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
