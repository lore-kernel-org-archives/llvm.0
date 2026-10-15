Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FB93D954F
	for <llvm@lists.linux.dev>; Thu, 15 Oct 2026 05:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792043178; cv=pass; b=cf2d9DdaDTqyeTEVUW0TrUw0NkGkJwymZ76PjHRdZfSpI2rekjDyiebcuQvj40q8yy1iQWmHEy+ZV/v50SDhcs97Mjlgx0BJM1MQew+texcZhM6qnUo+9n53PPhiQtEgdMmtPsTRVciBlWsEYqqPJXmTi6kTJduPUs3BW3eUenU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792043178; c=relaxed/simple;
	bh=qezJc4NEIZrhsd5+TuSsc3OnyYFh7Gr+9COlR9C28hQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QHT5Z/44YccDGz3loheQINhocppt3LbCQTOcAEur+VTmwbVXHBwDLuoflDrxYGkF/4dm3xnff3Vry/4DaEFYjYDQLc7Pm2E7R06I6/89Ev/BiVMDqImb/cLfUpqLtu5A6Bb6okWTg89+7c+TwJv4p8W//RwvvmZb1JmqjaYzba8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oWmzXBct; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oWmzXBct"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33c30fcf33fso595754eec.1
        for <llvm@lists.linux.dev>; Wed, 14 Oct 2026 22:46:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792043176; cv=none;
        d=google.com; s=arc-20260327;
        b=XAbTZ7lByDs2/fUMcQIiKeeZcZ12mIK3Jc6eWE7UCOtiZXnKVvtSK0dLg2PlfQeGXD
         Mg3+yNjsBTbmXUnjkKknDq8fZAoHZS3NulQM9HMHLCEO+x0RPPmEWhOPDrt2Njp04oiS
         Z6qUmWNBrtFMr/X7vWZpoJQABWh/s1RX4KTdyDWFa3Hf4IysXuIps0/UE053F8FKmbSk
         E9Dd7zO5kxU4t6M/P8rvXbT3p1DnzjEWMEcLxxdz9/jlSl8Dr28/9HPJyC/y3n7tGkBZ
         iPI6L0SEOvuxXoqdeGeXz6z4eOU9u+sbI2Vp1POy6/NRVuJaP+6dgxVN8gCltG8wh3HB
         AEDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HeI0uiM52DuAwWHa/ijjOCM64Bu6o2GU+woYi97808c=;
        fh=ZSh9v5oDpIEUhzoFEMhzBeugS84lnj1AfHU7PP/lBxM=;
        b=lvGLHrjpFRPgUCZe6C7HOu9ZCHFpgcrTLi9baMsEIHP5kTlyiNnPd7S1NqCJouiwHI
         zaX0jHOf9FyYRsj3To4u0egiaPW1ye3yOLk/DRQlXraJ8JrtBUW9PYNwhhD6s2m1e9Us
         SWVYJK0h2mzoOirq216EDfFo9Yc3IWJCvB7nnS9hgsKoDGVryW3vUOdd+J2RxkbPVC7k
         ob7LWHL9e4oV157J761O3cZefHLvMDFQouvRiR5UkoPHsQZ4i3l/l9x3N7/cRRwUIpRR
         lHrCCz2ogXQ7qNeRnmwuUIHEYCq0mbyo2iVFqdNBdIWmwUU69GU5RivNFm0iuE6sQaJp
         e9uw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043176; x=1792647976; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HeI0uiM52DuAwWHa/ijjOCM64Bu6o2GU+woYi97808c=;
        b=oWmzXBct6Vgz8Zt3BsvQ8eZAoevSNtB/Uv2T57REi6DAEY5sf+qj80MYOj4D8LbC/r
         7GXkfFWnkmAEdkpIGwaT/IgAfOp1Uogh6YRQvFeZs9iaLZ2zf2YZZtLzNSThF8Djdw1b
         CvPvtoW3AFeKRBCGMVCuNtJM7BaxO4/nfMsAuJqwUZ63ZXZDVzmfsdT3B4dHlnG0FJUe
         A8lqVKbajyVaK8WxxnMGdOloyYW6pzN4TrgfdHc7Jo9gUb1h0VauVe27MR7lKlhfLvx4
         xFkp5zfRFac1hnjdrtfalBaSQ3fMoSpTu1BlanMuXXAAlf9HgLyZ57GNeXw/ik2ikiCH
         xVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043176; x=1792647976;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HeI0uiM52DuAwWHa/ijjOCM64Bu6o2GU+woYi97808c=;
        b=orH3GL06xCW1Wwh/gEQxn/KVIbvSVK90sh4Cyt82DiWHJJKQ6SQK3u4gCAsj2Brc5G
         ul4NP9qr/FHxn0JZA+l+qph8Cp9Ub4U+LHnyU/NwQy9qbRJBM6Rsl5NMxZnIPmS8vIeQ
         bP5iE+WZpn2SFcKxKTdE6uF9xgM62YQPCP2dE5oXCTUtYxHfpJ/TT7KbHC/1rOtAoDFs
         uwiarZNichlceJSlwzzgfxhre82okuTzfat+/Y28fFAaQiNPGtFzE1TmsbINQehnK3fW
         K04f3/eUc7Yc6jBojwXKLSvZkMHWu4GvzMnS9STzTQidquvh27+QahDm7ffwbDt4Xpec
         G0mw==
X-Forwarded-Encrypted: i=1; AKwUvByh+IGWiTtbZsee96k0hw/FEUSUtjpgysuYUaJxm50e0Iv2OZCYN4A5OjhEcmQwMtYOcMQ4@lists.linux.dev
X-Gm-Message-State: AFq9FYLWxNESkRIs5+P/zWW/ib2YasI1VVaMeL2oz5ZDSmOKmgEdLgO5
	DLfhvAn9jFlR2QvMC2f0UJO8dpensD2HezHu7KbkCJIcXWC7WW6zPbtOig1Ox2B9BaNLSnJyQLj
	dT2TAm2kbmgY0Q09Rr6dUZb6ZaeoIZtU=
X-Gm-Gg: AYBFou0LdvxG7gYN2SO33HWc8gNMIMOJddpb4D1scvArU2cUYROFHBckxDswCOGFzNX
	vHJLxATkzwyROsjTbPHJE4tHBteuwFOSXHFVHBJ64TLcOxx+TjpoqjYrvwg6w6k49gItA5EUMwv
	t8x2qAeTOxfoV1O7HfTMEqQK84Jo3GVXmuGkcnFnskWl0ckotszgAPCE8PPlYr4TcvaiJ8IP6zr
	jSEDIS/pMiOgSH9yoVQFqlVZUdZi5ndMofOwfKmrqxVWZnJXwgGuQqrOvIrlP54U1D0+5+k7Ssi
	o6NksKndigSM0viu0UhQ4saJpiwc+UkknxfpBTAu1wwhi/5o7hmFB6fQchc9ZhfySqssWDwsweK
	whQ4xyvMHEwKxNfSxrUI1njTEfRBOhIxyh1ndunF1JcMydQIMGsylMpa+m7kGTF3kOCF7pgWWhF
	6Ks2r5EzPFb2Ip4hfTZ5znMkonqlDuGQObfEGHpgVtbNMj66hjHpY=
X-Received: by 2002:a05:7300:da12:b0:35d:4c5b:766c with SMTP id
 5a478bee46e88-35d4c5b7a5cmr10711045eec.2.1792043176087; Wed, 14 Oct 2026
 22:46:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261014225811.i.852-kees@kernel.org> <20261014225818.3457479-2-kees@kernel.org>
 <2026101517-profane-opponent-4523@gregkh>
In-Reply-To: <2026101517-profane-opponent-4523@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 15 Oct 2026 07:46:02 +0200
X-Gm-Features: AclHuK9JUbZ8Kk1BEvh1a9rSCsQ_67UzDaXAR0CwzEKJckJP8Us1pVzDHAMPGB4
Message-ID: <CANiq72m_iyquf4Lc8AWvbsBp++ASz4+C_MQ5iYQW-fHd_MNDxA@mail.gmail.com>
Subject: Re: [PATCH 2/2] seq_file: Require explicit initialization of struct seq_operations
To: Greg KH <greg@kroah.com>
Cc: Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-fsdevel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 7:21=E2=80=AFAM Greg KH <greg@kroah.com> wrote:
>
> Anyway, I don't know.  I like this feature, and maybe it's going to be
> used so infrequently it's not a big deal, but feels clunky.

Perhaps we could call it something shorter, like `__explicit_init` or
similar -- I don't see that substring (even without the double
underscores) used anywhere.

Cheers,
Miguel
