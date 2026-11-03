Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744171;
	b=qtg0V7zy5JHh9iT/JrhnoG50LYPrmU7ioqTTio895cqIbJ2igKfE8gVfc6Wj+LQi1Fal
	 LZTJVLEoyNdG5+nLiMfRO0LwqhLwicrGO1vw1lnC7Q9XMgANtIKZZDkOhinNLSdPhiwCv
	 SqhGyzmRUcp64m9YRlGGM/sq/AVZjHJCN7rHQ14LdTUlZ70mLNih4OMmU4RwTBs3+Ep4j
	 X2aHs+C8tclQH4B54qnzW8R+ZB9zD3itCcJ0G41CBIizMC+7Jn4vdZUJavS2BpNNIfMYQ
	 EtKOKbVw0GFaG7vfyuXdNU9tarkT15C3YVxvywynYyOl+UTJdh35hyC3zxPQjOEGMuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=qa8VIormBe9BZ2Z0CvscCIHYAfEDqSjiMypNAooTP+E=;
	b=erCXBZcGirnYogjltHjyeThE00zyz8SPRc0tCEnY4ItVpZpbDHzNUMToDx3WVgLnB//N
	 N1bTAL1YLfgLdASPcqqwT2j3SKY/tRdVZtGF5PWNPQbvuSlkapTtsQRvqK8UmGFLlxKsR
	 gx2dSKzwVQxc8uQNRt5YbaR4U90FbmhZuEDL5xd+hYc2GTZsUMyJKUODeeAg6rHYlrv3F
	 /W3Qd2d8mv8475/XvRuxEsBcGC/1lVDcgyVHHAi63WfltVJsa7WO/oNLejaRxJ++rrKjD
	 +wwc/xC/FMNWBa5rHtn2sie4RrxABoU9E5YjALlNN2iQH8H7QIdMabPATafaHub5kVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--rosaliefang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=k3kCwJ4R;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB07606A329
	for <llvm@lists.linux.dev>; Tue,  3 Nov 2026 22:16:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAB07606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rosaliefang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=k3kCwJ4R
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3adeba76cadso84242a91.1
        for <llvm@lists.linux.dev>; Tue, 03 Nov 2026 14:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793744170; x=1794348970; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qa8VIormBe9BZ2Z0CvscCIHYAfEDqSjiMypNAooTP+E=;
        b=k3kCwJ4RNW0hBul8kmg70HRRpQFLG1ZFvSizuMbSewzi37hncAs5+OM+EckQM3EK6i
         Fzd+nMsgnFkY5iNDtPVycf9nBi8ulW2NtjEg3z4H6oVWX7Ek1PqyGKQMoK491LtVjubg
         40++a0i9ET+RmvHGv8K7Bja/PIgh0skFXdlCd2WUSPLugkOhttSU9QAX6gfPsv38XWu/
         fsvGZ7z3EkqtOea3ye/IkhVao0smbeM6mxYc9lWnHsMHWUmYLFOfYWI6W3KGHDYY0/xH
         MneOGwkpANe99CUlrhSd3SzrY0Pbc8FHU2KyiBpR68XetLwsU3Zj1BICXAK3SnIXWsny
         iujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744170; x=1794348970;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qa8VIormBe9BZ2Z0CvscCIHYAfEDqSjiMypNAooTP+E=;
        b=nGTBbvCV9rRKnaTPiZeg6L4ucMhZ1gvAyf2egiZz0JPMAAHd3vc2hrOTU4V7l+4ZR7
         fGFOi5hZB7JADBdbodFGfj17pP6kwnEYhZL5tPEzAqNSvvy5iuEtr9MPfFmeoZxpoFN3
         vIG3/gvQJzxx2ySj63BApGbmw9c8gKRluGQmRl+OwpgfmM1CzYZ8Wa1bT/ffUAcp7WTR
         0JO93Xec/4RCzK9O5HqPAQCw/Yu4LgEDFyZY/+ZAdiOgORhcs1YEYXqajLiKAQMj+rAE
         PZOB3xMUDNCf3B0q56S1fbxGysa7NmSzD/SgjZoAJz9WLTHmmK07oWCP8k1zvjM6pv9E
         UFJg==
X-Forwarded-Encrypted: i=1; AKwUvBxzNsoRoXqSnyG2qjuFhpvucqrIkxvXzUt3Iu1XsEWW7wnyw8XL1kbs1srCTNKvomXk0bZo@lists.linux.dev
X-Gm-Message-State: APuU4Z+/GKMmr2apSwP5ZmH4rPVPWxiqjH7S/RA0VuA74Ns0GttoT0OB
	vN/TbqgKtYeo9Yy8UXQ3BTgUFNYWYUIQ3xeDygw+6bj+4tPEeNndP2n9LHJpih0hcjP6aKvj4Sd
	TeTiP+4g3/TVbqmyix9RXoo4Htw==
X-Received: from pgca9-n2.prod.google.com ([2002:a05:6a02:6389:20b0:cda:e974:da34])
 (user=rosaliefang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2f0f:b0:3ae:8106:6074 with SMTP id 98e67ed59e1d1-3ae896f8183mr12261152a91.16.1793744169711;
 Tue, 03 Nov 2026 14:16:09 -0800 (PST)
Date: Tue,  3 Nov 2026 22:16:08 +0000
In-Reply-To: <20261103190052.GA267580@ax162>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261103163404.159582-1-rosaliefang@google.com> <20261103190052.GA267580@ax162>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103221608.2030675-1-rosaliefang@google.com>
Subject: Re: [PATCH] lib/base64: fix -Wconstant-conversion warning in INIT_1()
From: Rosalie Fang <rosaliefang@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kuan-Wei Chiu <visitorckw@gmail.com>, 
	Guan-Chun Wu <409411716@gms.tku.edu.tw>, David Laight <david.laight.linux@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Greg Thelen <gthelen@google.com>, Yi Zhu <chuyee@google.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 03, 2026 at 12:00:52PM -0700, Nathan Chancellor wrote:
> Thanks for the change. I avoided this in a different way, which has
> recently been merged into a tree that should be merged into mainline
> relatively soon:
> 
>   https://git.kernel.org/akpm/mm/c/3af83c11cf5990fda0bfe3959aa6391ff903ffdd
> 
> For the record, I do hope that
> 
>   https://github.com/llvm/llvm-project/pull/226775
> 
> eventually gets merged so that these workarounds will be unnecessary but
> I am not sure how that will play out yet.

Thanks for the pointer, Nathan! Please disregard this patch in favor of
3af83c11cf59 ("lib/base64: silence clang-24 -Wconstant-conversion with
diag pragmas").

Thanks,
Rosalie
