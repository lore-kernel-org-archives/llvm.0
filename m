Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B576A436350
	for <llvm@lists.linux.dev>; Mon, 11 May 2026 16:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517316; cv=pass; b=dfa0b829qitmPced4RfXYE9S5FBADUAbp/ysK+TudZvNavk5+mKGMnwDj54N3yWqDQwxMGjkVh0bx1e3l/CPXxEBO4M9Zhe7p094MB6LNGhEhltCgWXYp5quCVpGA6WeAKJ3458teNDjnMNj7DTU4QelaBnXvnAxrtL/jSFYxJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517316; c=relaxed/simple;
	bh=4S7C02MIUqtzmropOUva8L19yYp6EZ1lPURTmBTWjnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YuXdItVe9XT7RXFC+wr+bXl0SzScmGTvV5x2RDwFSdt1h1zCZ/6k5N2aZoCZe+vEFWGrJmIp2jpQOPasvmU14JWXvn9eOVCLbd5ghhnAHuhJTf3II1fACWMje/adaTIiW/kFqLgAworYGa/AdmOa+HFEWxWDdC6/VoIQWNdfebs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b/wTv2lh; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b/wTv2lh"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12c8f9846c8so6388906c88.0
        for <llvm@lists.linux.dev>; Mon, 11 May 2026 09:35:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778517314; cv=none;
        d=google.com; s=arc-20240605;
        b=l1UWz91gd3rnT8u71ySVTjTcipM6IkIHEEdbaQ6fjLzcSO7JD62DW1NuN+HB0Rkpmb
         f2CVd6p9+ri0VOawy7r84y0t/9HTivb29zqe7y5WbsNdH80imy6HyhGPA7tc6IBD2/Zz
         LeFuOUDCGKAW3eI+6w9D3/5SOR6psDKbih3aHxC0Qf6Oqraz/RbbyIF8mXY/zKkxPGht
         R1XyEAJIGQkdB0tFXYMMb5+pT1gAw/c9Jbr0lhz4rL4VUYqI5BY224lWXjQJgHdBlDZv
         qO4TYGlAZ/7uYy2HDDkgF0MaVSDNct0+UMPWNkAwJGee0VGrS0S8sR0x2O8Jbo4Why1V
         ZjuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1buMrZnL5eF5p/xBeXqRPyloQLFILIM6omdsc97ttuw=;
        fh=lDhKPuJa3mo+3MBxuLLyFHPwip2Id61KH+CewghRwQc=;
        b=BrByiban+4JrR0PcC7dX/9gs6nc6gh5UtUryz09zkxHUijFLuJAtoP2iAJDIZ+5p2b
         FFdb6eGPNBPw5sMX8lwb7ZDOa73suSbBISjWPWJ6qBKaAfkWi8oQxUpE1SRjGx/7timc
         GWhHwFvzcZoFKLON2IBC/RiE7pyQKOqcfelBdKH0lrmhXRQIJIKmPS16RmUtNh4W/JM8
         ILeqkiGckwdMQjQG+PYYlstISOYRwC8N8Ch1cfvVdk8j6DLVR243s9II6T4J7t0RKboT
         MrsJmeC1r8bia0S2PnqdAlrcW9IG/bW4py0M2LUzpQx9MmptAFPN5f3um2piCCG8QTlJ
         ADhw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778517314; x=1779122114; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1buMrZnL5eF5p/xBeXqRPyloQLFILIM6omdsc97ttuw=;
        b=b/wTv2lhQjkGibCQf/sMBIf9LYcJ73KaNqM3WyUMvVHfTno7GAhKb6H5pGkx4jeL37
         DuNDJu0x0CQOMiVA2+Ssae0ZRFV5wwfJ+7a1nHC7QA4dGEPBgKoAliAABqCYyByJRZJh
         wy41PdgOTrqgLPq8FALxafR/e8pbE/JU+LZjZNxSsmxtulL+S9UlXyr/tXGEOcWwuATC
         1Lk97vEqxphkG59jRyattgAUGv8CvagHdUVJCavemXZouox+r8K924MV/fhQUuw7S6K3
         JgLQoPo3ogCM5T52XFzhfqzjAqImGu6pU7WCLQozLDRgv+GgcpxFO63uDCLDH47rQS30
         mXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778517314; x=1779122114;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1buMrZnL5eF5p/xBeXqRPyloQLFILIM6omdsc97ttuw=;
        b=gAHgUG8BNRGHeoOivmgBunXHhwP/PJBfZQz6UO6gvCb1znGJx5zHmTdW0vy/XlSRJ7
         4kjIGgcunEpExCVse4J7/mVxZaSfQqbcpgaNwLUNmgPly5uFzNFR7lDkYgRNvgf5QRL/
         ayNURFPZRwAaNRHV8zTNR2mH+/pbv4cFCn2h83Xa9/RJjaNwi3/qXWRuwYDmYFdhi9l3
         rtTVOe725gZph3IpRvwzr+jn8nUx4vmkuE/2ZoYcEuGwG38aQgwTLAt99juKEWYB9bAM
         ThoPNw/4hgay3OmSUR19m8cOrkkC2NehDpJxKX0s3P1CpRhKB8gTpX7EE/3cLD+TnPpQ
         OdBg==
X-Forwarded-Encrypted: i=1; AFNElJ+TPPf6CHmHTIJpqntRk6f2vVDdjXCQ/K++FyTRp92MHjEgugDf5hRhhjwJ9meI3VeEoNPs@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2ljwidJC8Ohdw4e6uoTrwrKvPtg/9DLtqIEmgpoyHYtUEP1ih
	8v7WT8K7fnx97iATm5clCb9i6UeYWew+CzEC9piTONquZqGQlEVnBOvc2hJI4L/Wr2HxvOc3qgF
	aa2SaLGIccMPFmLKQHAoU2CUCN7qgeLEBpcXExaic
X-Gm-Gg: Acq92OELUdD3SEmEm4uGIdshmcqfuUOkVMMoLKCsxFiG4u71fvb5bowQb2CPR+ZUmIn
	wyuDIZNN6zvRqbkZzPARn/8CcRkQNMIouAUadt+83OXnUOMxdUPcss1ktxGROnqHGDR3cIchhQS
	trl0ZbRggYiqmsyUJyQTltp2AjLU+4zTJsoy04BwLN1NtWTFXE8S0Kf9AdbQK4LD9lT/7XyAPRz
	3N2nG5vbVlH8bkDkxIzjtxf5ecqiquzJh3R9PpuRHfPX8rEF/vEd+vB0hg8aMWztR3RNOYwr5cn
	cOTGC6Xfzmh8VioNV75310Lh9dDIUrZsTQbWP2DL98IZcCQRu9r7msHFoQ4E
X-Received: by 2002:a05:7022:699d:b0:133:39a6:2b8b with SMTP id
 a92af1059eb24-13339a62ddamr337498c88.44.1778517313279; Mon, 11 May 2026
 09:35:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260424132427.2703076-1-elver@google.com> <20260424132427.2703076-2-elver@google.com>
 <9c321184-9080-4d5c-bd1a-a16cd0bbaed3@kernel.org> <CANpmjNN_=g31Eoa+w1NrFALfp1dDBi5oHEZdr_bA_48-tS2M=Q@mail.gmail.com>
 <afi0nQ84k1oz5RyH@elver.google.com> <871pfiw343.fsf@trenco.lwn.net>
In-Reply-To: <871pfiw343.fsf@trenco.lwn.net>
From: Marco Elver <elver@google.com>
Date: Mon, 11 May 2026 18:34:36 +0200
X-Gm-Features: AVHnY4JXza1HWD1Ghv5ACGmGvnp1cOeRA6XD-S98uX5BfJA-pjXWKAfvxk-IzaE
Message-ID: <CANpmjNML=pbnv7QLf8Qi4wY2nDCk6oOw2T_Vs-MfMwWh=0m5Ag@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] slab: fix kernel-docs for mm-api
To: Jonathan Corbet <corbet@lwn.net>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, Harry Yoo <harry@kernel.org>, 
	Hao Li <hao.li@linux.dev>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 May 2026 at 14:19, Jonathan Corbet <corbet@lwn.net> wrote:
>
> Marco Elver <elver@google.com> writes:
>
> > How about the below, i.e. adding type decls that only the kernel-doc
> > parser sees? One complication is also DECL_KMALLOC_PARAMS, and adding
> > kernel-doc parser hacks for that looks pretty awful, so this is a lot
> > cleaner.
>
> I'm going to be a while catching up with things, so this is just a first
> take.  I strongly suspect that the people who object so strongly to
> documentation markup in general would be less than fully thrilled by the
> addition of this kind of workaround.  I'd like to ponder a bit and see
> if I can some up with something better...but again, it won't happen
> right away.

Thanks, Jon.

The technical debt (hacks) that would accumulate in the kernel-doc
parser just for accommodating slab.h might be quite high; slab.h is
rather special, so the "#if 0" solution might be justified. Then
again, if there's a reasonable kernel-doc parser solution, that also
helps in other places, I won't object.

I tested the "#if 0" version and it works as expected. So to move
forward, we could consider it in the short term, and in the longer
term, see what new powers the kernel-doc parser can provide.
