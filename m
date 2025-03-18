Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED94E20FAA4
	for <llvm@lists.linux.dev>; Tue, 18 Mar 2025 15:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742311919; cv=none; b=SK/l2El53zdXQiJwNavZ2LbN1gWuMSY71/vGJNLFlJP9n0T1zwqGR5EG8GQuMeTWsK8p7aS0VYOaTFXmFxLI/eZYrSMey6GS48CRQylFxSdL4HyMU1Oat4G/Na4f577Iq+tOiLnf26X+a5u8zSs14Pax5ySOMYCa5CR0/ouLVmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742311919; c=relaxed/simple;
	bh=3K43m0CJ5P2Hs/+vHT2aH+lWnI3DWXrYwrbq8SoJBdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UZpPTiWlDIxyrBwxEsFieEAdN6v1OIxFSzBORmL2/MUmwH+o8fliEGt2owDkt/8i6cAJfJR08OxZ9bKI0G/rbgVbrO1fvhOODw7RG1c8x5P/5steSPOxR4B5x2GN1isI1Ig0aIllzRpHmkTqIUc4L3nNGHFyoT32AqUX1s+gD2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DlGAM71U; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DlGAM71U"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38f2f391864so3329436f8f.3
        for <llvm@lists.linux.dev>; Tue, 18 Mar 2025 08:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742311912; x=1742916712; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CinvE4PqkImlncYqzwGrvxTtdjlYEnx4qMRt+q3DIa0=;
        b=DlGAM71UODaZh87C9aLKh7GlsY/TLhLDF0TgwPfXXa+o0C5mhRTus1AEomeB7+lKhc
         d6Yjh4cFGoiM5yUynrm7qcnvgEzk61TW24DAJcweNuUbMyoSkLHvrDjBTWg2gxWPRZnw
         /tv46vAw1aAIfH2WgT2sdynH8uEhivwS15YU4VDbS+FT98+Jlh24KjfZQLKrJu1VsSQ2
         V2lcyVRnPs9CIt1RiV2QbNU1GHeRVKFNWt9sXCYRPmdq54YnCEhUU4Cr2QhoXdYtfgSe
         SEUYDmq5fc0XYQOAKUExbA5F2Dn4A1JgDFGc7wf2xI1do4Gjlr/hQQJbBeTDa81p6tHo
         EsQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742311912; x=1742916712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CinvE4PqkImlncYqzwGrvxTtdjlYEnx4qMRt+q3DIa0=;
        b=MLbw3uitN69WmcRuWzcTWCWUG8jlUeKRlY1w1AVLNIeN3AiES4UejR158eLcChHiQT
         HNswAVKk2zR/vblaIiCI//BdkiTbPZVH6HPsPmGCCKCOfAn0DMfhxoVLuZAbglxm/YUW
         at2tPemT056N11Yj5JX5zOTkRqqAPfYR/FcDBjKkK3lAQ7reOpp6EPe2Yuga4DjnqXWq
         ZwEHHkcyP11EMxzdtrZaVgFzadad5dKHYIdYpAgg5E/0wH72VYY1tf4XX2uy3QRrutpM
         gq3U4Z4gd6g/nP3Uw7eabifjYYVyX6enJSDrz62EMVl3j6hhNkKy3e+BLF4fpuZ8APE6
         WJWg==
X-Forwarded-Encrypted: i=1; AJvYcCVeScBT2ZujEP2L1rRdKVF1kK8yI+i9J71DYbhKZ7TLZriotB9ZdRW6Ip0wv5FNm1TFPNBo@lists.linux.dev
X-Gm-Message-State: AOJu0YwFs3g4k7z+Fz8BWyqV2Ko7W2pLMNcRsIWvskDQcJNfwnwqrAM3
	QhMpAcJuSraiC8qosFtqlW6VnbwrbrxqZveD5kdrYo3KvE/hyweso3FXwCXyCIiQhfxlDj3EQKY
	jWNbF+geYcVnJQsN1mG2xip1DcgQ=
X-Gm-Gg: ASbGncvfkxPHR8ELieUXrMPtt/2G5vdeSRwThlbjhfZbGZX1p66K3EcfVV81MywVbOA
	nJC6HfzPdag27yU6tG+c3vI3eNHFwKjNcSqP52n9r0qFn5ffM05FTVms3WyHzAgcp1r4NTbmScO
	o5rZPkIyb5CeKhSxTh1sq9j23IL/4=
X-Google-Smtp-Source: AGHT+IHWPKWTHbtn0upDeL/n8bU40gn0yInHJsN/Rx11n80rZjNU/L/rCSH6qMBV6U/AqlSRsE+U9L0kwT/++6fzLW8=
X-Received: by 2002:a5d:47cf:0:b0:390:f832:383f with SMTP id
 ffacd0b85a97d-3971d1348b7mr18713568f8f.2.1742311911851; Tue, 18 Mar 2025
 08:31:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <gisttijkccu6pynsdhvv3lpyxx7bxpvqbni43ybsa5axujr7qj@7feqy5fy2kgt>
 <6wdzi5lszeaycdfjjowrbsnniks35zhatavknktskslwop5fne@uv5wzotu4ri4>
 <CA+fCnZeEm+-RzqEXp1FqYJ5Gsm+mUZh5k3nq=92ZuTiqwsaWvA@mail.gmail.com>
 <qnxlqbc4cs7izjilisbjlrup4zyntjyucvfa4s6eegn72wfbkd@czthvwkdvo3v>
 <CA+fCnZdUFO0+G9HHy4oaQfEx8sm3D_ZfxdkH3y2ZojjYqTN74Q@mail.gmail.com>
 <agqtypvkcpju3gdsq7pnpabikm4mnnpy4kp5efqs2pvsz6ubsl@togxtecvtb74>
 <mjyjkyiyhbbxyksiycywgh72laozztzwxxwi3gi252uk4b6f7j@3zwpv7l7aisk>
 <CA+fCnZcDyS8FJwE6x66THExYU_t_n9cTA=9Qy3wL-RSssEb55g@mail.gmail.com>
 <xzxlu4k76wllfreg3oztflyubnmaiktbnvdmszelxxcb4vlhiv@xgo2545uyggy>
 <CA+fCnZdE+rVcoR-sMLdk8e-1Jo_tybOc7PtSp9K6HrP5BEv95g@mail.gmail.com> <qacbgkfbfqylupmoc7umy4n5pdvpdp7hrok7hqefhamhrsnhhm@4e2qucovduw2>
In-Reply-To: <qacbgkfbfqylupmoc7umy4n5pdvpdp7hrok7hqefhamhrsnhhm@4e2qucovduw2>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 18 Mar 2025 16:31:40 +0100
X-Gm-Features: AQ5f1JqGFWmofpIZGo_iwNyrZk8kRGYUZ2Wq3IlRJd5hdIOL8VoWslIcfmDgzvQ
Message-ID: <CA+fCnZfwcV40i_78qY1WTdJc5PgRfvu-_7LERfJyPt6Xf8Ln9Q@mail.gmail.com>
Subject: Re: [PATCH v2 01/14] kasan: sw_tags: Use arithmetic shift for shadow computation
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: Vitaly Buka <vitalybuka@google.com>, kees@kernel.org, 
	julian.stecklina@cyberus-technology.de, kevinloughlin@google.com, 
	peterz@infradead.org, tglx@linutronix.de, justinstitt@google.com, 
	catalin.marinas@arm.com, wangkefeng.wang@huawei.com, bhe@redhat.com, 
	ryabinin.a.a@gmail.com, kirill.shutemov@linux.intel.com, will@kernel.org, 
	ardb@kernel.org, jason.andryuk@amd.com, dave.hansen@linux.intel.com, 
	pasha.tatashin@soleen.com, guoweikang.kernel@gmail.com, dwmw@amazon.co.uk, 
	mark.rutland@arm.com, broonie@kernel.org, apopple@nvidia.com, bp@alien8.de, 
	rppt@kernel.org, kaleshsingh@google.com, richard.weiyang@gmail.com, 
	luto@kernel.org, glider@google.com, pankaj.gupta@amd.com, 
	pawan.kumar.gupta@linux.intel.com, kuan-ying.lee@canonical.com, 
	tony.luck@intel.com, tj@kernel.org, jgross@suse.com, dvyukov@google.com, 
	baohua@kernel.org, samuel.holland@sifive.com, dennis@kernel.org, 
	akpm@linux-foundation.org, thomas.weissschuh@linutronix.de, surenb@google.com, 
	kbingham@kernel.org, ankita@nvidia.com, nathan@kernel.org, ziy@nvidia.com, 
	xin@zytor.com, rafael.j.wysocki@intel.com, andriy.shevchenko@linux.intel.com, 
	cl@linux.com, jhubbard@nvidia.com, hpa@zytor.com, 
	scott@os.amperecomputing.com, david@redhat.com, jan.kiszka@siemens.com, 
	vincenzo.frascino@arm.com, corbet@lwn.net, maz@kernel.org, mingo@redhat.com, 
	arnd@arndb.de, ytcoode@gmail.com, xur@google.com, morbo@google.com, 
	thiago.bauermann@linaro.org, linux-doc@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2025 at 3:58=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> >So this was my brain converting things to assembly. Feel free to
> >reword/clarify the comments.
>
> Right, I focused too much on the signed aspect. Treating everything as
> overflowing sounds better, more unified.

Alright!

> >It could be that your checks are equivalent to mine. What I did was to
> >check that the address lies outside of both contiguous regions, which
> >makes the checks symmetrical and IMO easier to follow.
>
> I drew this out and yeah, it looks like it's the same, just grouping the =
logical
> expressions differently. What do you think about incorporating something =
like
> the following into your comment about the x86 part? :
>
>         Given the KASAN_SHADOW_OFFSET equal 0xffeffc0000000000
>         the following ranges are valid mem-to-shadow mappings:
>
>         0xFFFFFFFFFFFFFFFF
>                 INVALID
>         0xFFEFFBFFFFFFFFFF - kasan_mem_to_shadow(~0UL)
>                 VALID   - kasan shadow mem
>                 VALID   - non-canonical kernel virtual address
>         0xFFCFFC0000000000 - kasan_mem_to_shadow(0xFEUL << 56)
>                 INVALID
>         0x07EFFBFFFFFFFFFF - kasan_mem_to_shadow(~0UL >> 1)
>                 VALID   - non-canonical user virtual addresses
>                 VALID   - user addresses
>         0x07CFFC0000000000 - kasan_mem_to_shadow(0x7EUL << 56)
>                 INVALID
>         0x0000000000000000

Sounds good - I like this visual representation a lot! Thanks!
