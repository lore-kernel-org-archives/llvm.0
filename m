Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793930452;
	b=Ho+0ON25R+YwbAjfE1uObMmmDy00gKf5XA7NKR6/Wgtcz1w0MVy5SE8S9zgwZHqzxaUY
	 SZ6PrjiB4sO5JcTYuL8WZjwk+jKOKyRUpTkvEwZ63ieMCfNuvz/uJApe/o0kpgsUpysTe
	 xNajtTlLXnF0KLfodRScCG3zp+bfxUQfM3ryEjue1/iKkm+xR6/TKZtmLv+OA0InV0cRw
	 iGjiEfEuREMsxhMm1Pzegt75ZNhD29ZNQwtxLPieByVFKsUda4DHnHFODUfa8O1J2iCPp
	 lO3qp7zNLYiqV6sLIDZ88l2pKcQLbqV+8Rs5JL3lQD4cr576y2WA5X/VReo27PZvLRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793930452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=s7c/qg88c8erx5Dvpd9/JaL1ilkeZNtkbNUxPsE3zPs=;
	b=xVWpk5icgs4Q8vd3iT08QCRPgisRn7Zrhd/AnobaielkV/ahF9BFNC3VB0zAPxLxc4Da
	 V8Y6AkReId88N/goh6R8FNQ+/6Te2SBw3QmMq/YwD7/v15zTsBJ42DXLPdJSs7aGGxWN7
	 CV/8wMxkBKnKymBBDRL7wwZTJxMHhNKRhwadGZJuzfhuVWUKwVWtL/W3C/Tr6nDGxddI0
	 NlLFY/0FOcJuLttD9enY3Sguz2FD7PEIb/RuBivhPBnP2PnVQecxHNtEkS2JFSyqNWcgs
	 aGg2TyTd2DwLqDnhOyGSuhU5zqP/V0Dy2F1eZ62/iNKsrzA/+0+t1rH5hoSlTk9mGGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=f+2coMMJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDDD606A329
	for <llvm@lists.linux.dev>; Fri,  6 Nov 2026 02:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DDDD606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=f+2coMMJ
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4322d310e7so23158166b.0
        for <llvm@lists.linux.dev>; Thu, 05 Nov 2026 18:00:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793930451; cv=none;
        d=google.com; s=arc-20260327;
        b=qvjfkoxsq7y/3/AB/FnDlOLx94ehNnFN1Jdi2fzwAtnpJuSuo1279e6fe+pq7YHqaY
         FljX56/e0j9HejU1tAJajF9JE+q12NC0q8X11ouZQkxr1rf5Cl07oNagOXs2lQIqOV1L
         4Oa8JnrXh4muWHPkEVqVveTDyv9gp7hyByW3sedWPGpQCYgTfSFB27i/opPvkbwLnv9z
         d4VQxkaDP7ulhHAeOqLVUEd15WmtTBNJ0MJX5iqKE3zEcKnmMwDYbPxCN63ngR6yO2Zt
         ByLwX57wg1U3gEmsUZ85ZyO+tl6zEicvv2CnWvNtPc+6u1ItXIVAxonsFZOgBaMRJVPd
         dnMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s7c/qg88c8erx5Dvpd9/JaL1ilkeZNtkbNUxPsE3zPs=;
        fh=MC4l43pZRfrWH2BbC0pIQI3L8swaiklJg/Sy+t2xu8s=;
        b=mimt842KW4mpu+6FKI5VGdVM4h0yLUjYnoCa70Ot+9RnCbCxHZ962XL7o+3ZCXnNsD
         8sZLKItl8MjM24vCqc5PVUsghkR3akKsiUxPs+jQoY7Lr6UcdlEwwO5zpiKqx58eMeAp
         sF1ozX7hRolv6wuSv1PiDB+em3mRA9IAeGe6aqAkZ5XCZSnmIfjWkvTRa8L18BEivcZz
         fIIq4GrGG+aGf6bOWJBKwz765TXqyMSHQhNySq1VTUsuTwfh3cU38sEeqFAICUOiihee
         NvkzyI1oDd51OzBt9AcUYcobCXCdLzOxnO6soKfgfNjcNi22lCpuecV/8h3W5/WMtyiL
         1/8g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793930451; x=1794535251; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s7c/qg88c8erx5Dvpd9/JaL1ilkeZNtkbNUxPsE3zPs=;
        b=f+2coMMJJLmlQjwdZlTO/vX0xKs+7iEf8KjDYG6joL0igLI6k7PmEt+g5HCF0rIqBJ
         /2haiTc5xcBKXx3fCL7b4zJX4vG9eS4dxRgs36/x3kxe+OVJE4lHkZL+ieb6rX2HlJCY
         M9JXIdupEC/GF0iJZLTtGJdR1X7WRHmZDWK1b46ckqDaerWC8+A/wioNxwvwIl6KLo8j
         nw39NLE0Q6CPhc6+CCDuFVd7PACqK9qhaXPQEQuxv68ZPbl58Lj5tHqmLUTDGN2Skr23
         AbAp74kxIx0ZO8i4xK0qce4iWhEDkvv2hsKWwAkBsNcfqjn7pFkuzHDJ2tDXak+EBH/K
         mVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793930451; x=1794535251;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s7c/qg88c8erx5Dvpd9/JaL1ilkeZNtkbNUxPsE3zPs=;
        b=t53zzNZpMtAR9ON4XQLrPeiDALKXzS7GZIXsvjmtnUXy4b1WgcBiz5ZeuIC9kiABYp
         puGe4ZfciYOSPCdC+UFcEn+EreqYp7m5f2GI9F2uQ6YK2nNl4vex8rwgF84I/p29I+Sk
         +jHTZHRW/UrLe7RKL77bi6Lfu2T0h03yjG/Y3ZIk9EWW2HsFC+vMsGFSlmZLRqSdHPJE
         1jv3e0RKOHdMsdcMJ39/H57QYUX2cjpKXWlu0S4efkR5DqRFo95oh0/s9eBqcAAYiEpE
         UG74QJ4uPDMEfAaFktZ0PljobeC7eR/aTuyCJac32lNEY4hFxGDTRs6mOQPiJCQ3yGB9
         ZBBw==
X-Forwarded-Encrypted: i=1; AKwUvBxelYOMH4cVJT1VhTMy81VOvAhIyQWzsEyog/SLy+I/6tdietaHJvSk8v7Dh8sGkmjXLghn@lists.linux.dev
X-Gm-Message-State: APuU4Z8B/7F8U+Ck+Gc7zISi42ql4Jto5E2cn/nAvYnDLjrY7xgNr6X7
	VRDVxS4SmoPCtoiLqgGHG78sWfXLoh21QdINWAyq4WyqizEl88HHy5K4fYKnn3ilcih2ajqYGaJ
	JMfP9/FFJ/gsDqehNDIbN5PUkOiyYvAIvh/VORfYh
X-Gm-Gg: AYBFou3BWXB9/qBu5IMk0jPkserqMiNMsA/MJ8QsK/E2z3xrmUA6VZno3GMaSkBGpnA
	LQJl8WJjJwJwVKnUJgjqRbA1Mx8Go3HYFp+jMuyxRKGu/IRXvf/0nAHaRw3Wgg+Dx9pb4SVNlwk
	oG07BRqjhxcUHEWFxP9R1pUPqSBuz5U4mTdGMVh/ghwGTOI14czU5jV//4X2vYZ0w519AsRk1dj
	6WR8Urd4HfONl5MCFXjK4bSZ2D0vmnIg/8aAllVK9ClWFmMlJ29atg6mEgmbBSLNOl4YjHIuwpu
	Q8rt3J3tDh6d9q6X0omk5Uxik6Aq8kyYcVmD5Iv1204fme6SC7+yS0ajiyc26OxlkqwpGMj2bTI
	XCByhYfaz+ffe7po38Foq0eMlbuCChDbEpcDqRDim9Id96fDX99KVsVTWY1WieIc1U9C09YI=
X-Received: by 2002:a17:906:ef04:b0:c24:6985:d7a1 with SMTP id
 a640c23a62f3a-c4d3468f9f2mr101330766b.7.1793930450357; Thu, 05 Nov 2026
 18:00:50 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261023001603.560210-8-wusamuel@google.com> <20261023001603.560210-9-wusamuel@google.com>
 <20261028134012.01d52e94@pumpkin> <CAG2KctpGPHo-S3AEvBhK5HPUnDHfoJu6Z-r+cS1hQ4Ps=B3DmQ@mail.gmail.com>
 <20261030100215.6f8e0d4f@pumpkin> <CAG2KctqdPq6NmK6rB13s2bgM7kP2w4OMMy2hdp_OFMVYYhTnZA@mail.gmail.com>
 <20261104142307.431fc12f@pumpkin> <CAG2KctrY6GmVqsKP+fXYCsL6wDR4zp1kdRd7a7uOdCgg_JcMdQ@mail.gmail.com>
 <CAEf4BzbYqbPRPWQU9yM29E+Pr68y+KX0O8whK-36dyH=Zd_udg@mail.gmail.com>
In-Reply-To: <CAEf4BzbYqbPRPWQU9yM29E+Pr68y+KX0O8whK-36dyH=Zd_udg@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Thu, 5 Nov 2026 18:00:37 -0800
X-Gm-Features: AclHuK_AXTODf6fbRoRayz3qqp4e-qEs_ls_rSieFkkllrojC2ZFyUBK4KHwxAM
Message-ID: <CAG2KctpBEtBxwb6Tayg8z5na39TVe9GQ1+Bk5ts6eL7VaKjKnQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: David Laight <david.laight.linux@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 2:32=E2=80=AFPM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Wed, Nov 4, 2026 at 4:06=E2=80=AFPM Samuel Wu <wusamuel@google.com> wr=
ote:
> >
> > On Wed, Nov 4, 2026 at 6:23=E2=80=AFAM David Laight
> > <david.laight.linux@gmail.com> wrote:
> > >
> > > On Tue, 3 Nov 2026 17:14:26 -0800
> > > Samuel Wu <wusamuel@google.com> wrote:
> > >
> > > > On Fri, Oct 30, 2026 at 3:02=E2=80=AFAM David Laight
> > > > <david.laight.linux@gmail.com> wrote:
> > > > >
> > > > > On Thu, 29 Oct 2026 15:05:45 -0700
> > > > > Samuel Wu <wusamuel@google.com> wrote:
> > > > [...]
> > > > > > BY_NAME matches names exactly, like kallsyms_lookup_name(), so =
they
> > > > > > would be different symbols at different addresses. Please corre=
ct me
> > > > > > if I'm missing something here!
> > > > >
> > > > > Only that the user might really want one of the copies.
> > > > > Sometimes there is only the copy.
> > > >
> > > > Good point. I'll have v3 add KALLSYMS_F_PREFIX + pos/next_pos
> > > > pagination to cover these. A prefix query for "foo." also finds the
> > > > copies when plain foo does not exist (expanded on this in my reply =
to
> > > > Andrii's Oct 30 mail in this thread).
> > >
> > > I'm busy rebasing my patches - they got stamped all over :-(
> > > I should get a v3 that applies by the end of the week.
> > >
> > > I will add a 'prefix' variant for you.
> > > The 'next symbol matches' flag is exactly that (actually it is a
> > > this symbol is a duplicate to avoid issues at the start of the array)=
.
> > > So in this case that application would always need to read
> > > the next symbol (by name).
> >
> > Thanks, that would be helpful. For my v3, I'll keep the lower_bound()
> > approach so the two series stay independent, but I can switch over
> > once your series lands, so there is only one search over the name
> > table.
> >
> > > I think it might be more sensible (less pitfalls later on) to return
> > > the symbol number - not that of the next one.
> >
> > What pitfalls were you anticipating? If the current symbol's position
> > is returned, userspace needs another ioctl() call and an -ENOENT
> > check, to learn that there are no more matches. Alternatively,
> > returning the next position means every call pays for a look-ahead,
> > which for an unfiltered query walks the module symbols even when
> > userspace only wants the first match.
> >
> > Andrii, do you have a preference between the two?
>
> no perfect solution, but given you don't always care about duplicates,
> I'd probably return the found symbol's position, which can be used for
> further pagination (if necessary, user just does +1). so, let's return
> current symbol index, and have way to say "find by name/prefix 'blah'
> starting from position X", where X will be previous symbol index + 1?

Ack, seems reasonable to me. Thanks Andrii
