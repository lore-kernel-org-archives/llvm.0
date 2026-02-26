Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065433ED122
	for <llvm@lists.linux.dev>; Thu, 26 Feb 2026 14:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772117410; cv=pass; b=nv/15XPab9z24DRzOUb/0DvbIhAN8JfKy54EVrSZNCqvLpQe6AC38uJehLK2aj/mrGh3JvkKt9qoGPO/7XneTlYOFZVNp9w2TyRXfNeAw/1v+m8/EW/hls3Bu/5XifeUZY1NzsXxmpAn8UrweOe3k5OlZwhobWKwE6UJo2F8s5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772117410; c=relaxed/simple;
	bh=KekDczAjttjdPIAASj6jFpKhDjUrSax8QhJzWPfsV7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N2guWCernQ4HkR9YxmBYXyi/GFcYmHeY9R1v7vZIHQJB3aKkL9Sn99lM5BwJlJYyRxDuFsdIWM18DEij0Fj6qjtdNgugWPoRfWA+m5KBameJNVOQ/zRL6zhP6CZTI+2VZ3GBloznyy/SXwD+I8k1e0YWuVux4fUKStapSXS6QSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SaTf1M7m; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SaTf1M7m"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a10e8cb3c7so300175e87.0
        for <llvm@lists.linux.dev>; Thu, 26 Feb 2026 06:50:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772117406; cv=none;
        d=google.com; s=arc-20240605;
        b=PPVhESgfXqJUwBRIBGJZhnTEEXxHT6/O+xG/RZlma1azPVapC/HHPPC4p5xCqbMMcK
         rbl2iTaW+YB5PHSeCW3Iaqs2wGXr/jZF2l6T3RjVBFd+iJ1sv7Tbw5qEr/rft5k5bSNd
         0oJpocbbW1SdOMPWtiCoMXAC0pB8+FqA7nrbuXOjamZ1mXRZvcvjU8YVwUfc59dq9icd
         F6JZMEdTcWhYYngfmvXRXOTPbxpx+Z/O3//V6D00ie6RzoJyhBVE7bjZyTsk86RrvIZx
         PraHiKO3Jy1LFb+BlSUAfaXAaFxjGfetH+E9vM8XzYD9A1xWvlQK93A4lznX2TBwjvDw
         5aBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ecLlC2Pj1S2xYZyAS5QAxZieaItgxfHsGP8vcA3A8mA=;
        fh=FUuPryzssfceTwukdyoJUAg7C6uEtCibVMt8G0g4ovk=;
        b=BNRaGZtl5V3O1lxnAX81NED2HYezXMOhorSer2Uz5KGbaGdJmF6007XO1s10PKRs1V
         B9E8gfotAy4ypR2K+5e2uDFLdFhO94AiffEWIo6HlmTMOimvp6AckLvvFFOL1LzTIIml
         MmhVt4GHQazMV4P9PCrEgrJK707th9cKSfEpI1ZHpJgqaVBQlF+4D3fqhQh3Z05ou64w
         pk3F7yqzY6KH9xZXm2x4RDYzglxnBFJG2Mqkk/8JFxLJNIJXW3RU4VlwsGa6crAg48jD
         XtOdSAFYzJSmH6oL6YfPgUnTVttXm+H7vtD77bqMdDMtAjH9OEynM09Gp82VxuSDilRG
         3RXQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772117406; x=1772722206; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecLlC2Pj1S2xYZyAS5QAxZieaItgxfHsGP8vcA3A8mA=;
        b=SaTf1M7mOmMzyM7tru3FdsewQt7Wvhvsc5VM9HWvA/d2cJlB2QM5y6kPegSPA8+HHW
         jFfwl+tWG7cSsGHFqtqYL1fHV+6Mkr50v9Vp/u/8fPe2BLzlmKD5HrWhzk8b4zgNHunq
         iR6H1ti7AwensFg+CuUCrRSBc5MdE5lsGOcWD73GNcyH/6WCQ0jNcxuz6BQzmBF1CoOl
         Npg9lzcSxFIS7+JIoIbkpd+TDtacmSvqVPdW9eOIqSu4Ksypw9R2OpRmiu8hBYv+qdkn
         MeDmIRTHV0b5cOdzsExaYCihdYzfYRZaAlgRAUgtGLR11yHdzhHTaRwf5HOWl8mViNqN
         kLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772117406; x=1772722206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ecLlC2Pj1S2xYZyAS5QAxZieaItgxfHsGP8vcA3A8mA=;
        b=EpnpEm+Sz53i7FDq/H8Tx41iM+g6BnAdhmap2FpsZYZDIFlgqn5PNPqOvPbgZ8vidt
         BHVdmTSz83rr7FKh9kOxWadsUru1+F0BRe/uK/iekGqJ82GQISSAWYA72zyBiuyKLJnU
         DPkxiB8hEZIFgtEkLfF4hpD6TzQPHjsiZG7//GJ04li1jUUIW2dhlvhqWg1YNXwNTkf9
         0JoT/zS5LfSQgWnjtQ7N3RF/8mYuKS40XrFiy9tvIvH8Fa2OXlwiGK2zMS/rfXXBjEJ3
         cbLy7PIX8DCEhKonLKJ1R5FhcKLTsfjBnjvEUHhrriiGUn5Jippu/Cs2HqA4Y3+IpOA/
         iCnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuk7LXUFYN+Wyq7Ixot726SgyABg/h/LQp89Ndbhl8o323Z3A35UDRISqXJ3nybFWtlEXc@lists.linux.dev
X-Gm-Message-State: AOJu0YxfzruRYTPpoq01H1Gwe/0wwc+isjLyXP4HS1Pf2B45pnZP81L5
	2Lnwx70R6kxB0tEY3Dkv7WwB/zsaEjUeiplDXn6Pkvz5rYyiUH9gCrqz0u9Oxy+vxPgO8m4dZf4
	M4w/Xbup/DIFVy7f3okFsc1Lhvexd6fE=
X-Gm-Gg: ATEYQzx+1gWW0B0Rh9FXeYMDZvN2buDCNKiDNud6THVfyzS0M1P7s2x9fvI/czxsG05
	EOP0jYSA5hkNSnVq36fRGe1YSnsQsOx5EBnOBI9M/7bZkCC0Wx7MRHqAwMwqUg9QDSySPs22lOG
	uRizZvbyCgz/0OEK+B/PasBOEXO+ZJYOEERxFaYbjlx/qQLjiK3JOPhlkbfZtNnazO3poDXtZ+7
	AWBXgs85bZBzGHoQYRA3wrmpljBm75Eh1h42vGLlXJXWVU9RkkycG41wM22hhtIVXkwPS0fawCf
	7hbZdMkaO9OHhZ3HXDa8b3NcioGitqCcRGKfGjZLkZYd/3U9nko7HegmhvN/UcQKVQ6JalvJIsr
	UiJ3JHQHuwNfcM4Li/0MpqLcaaq8=
X-Received: by 2002:ac2:4f15:0:b0:59f:84ed:f1d with SMTP id
 2adb3069b0e04-5a109a8a3a3mr918865e87.14.1772117405854; Thu, 26 Feb 2026
 06:50:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260226111721.25454-1-yuuchihsu@gmail.com> <CANn89i+rJeZHoGna5PGWN31UGDO3jy1xx-rWs0SA23H6mU6qKw@mail.gmail.com>
In-Reply-To: <CANn89i+rJeZHoGna5PGWN31UGDO3jy1xx-rWs0SA23H6mU6qKw@mail.gmail.com>
From: Sam Su <yuuchihsu@gmail.com>
Date: Thu, 26 Feb 2026 22:49:51 +0800
X-Gm-Features: AaiRm52xUwANJjZ_usW7QciNefjd9_CIm1_D3Nx375ksfqWn3AZL4KtPINaeUR8
Message-ID: <CAPAzCqEtb9r6pP+A-RjnAKeLbHJJs3Cc3PuGcmNSR9GpaCLjdg@mail.gmail.com>
Subject: Re: [PATCH] net: ipv6: fix ARM64 alignment fault in fib_multipath_hash_from_keys()
To: Eric Dumazet <edumazet@google.com>
Cc: davem@davemloft.net, dsahern@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Eric Dumazet <edumazet@google.com> =E6=96=BC 2026=E5=B9=B42=E6=9C=8826=E6=
=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:02=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Thu, Feb 26, 2026 at 12:18=E2=80=AFPM Yung Chih Su <yuuchihsu@gmail.co=
m> wrote:
> >
> > struct sysctl_fib_multipath_hash_seed contains two u32 fields (user_see=
d
> > and mp_seed), making it an 8-byte structure with a 4-byte alignment req=
uirement.
> >
> > In fib_multipath_hash_from_keys(), the code evaluates the entire struct
> > atomically via READ_ONCE():
> >
> > mp_seed =3D READ_ONCE(net->ipv4.sysctl_fib_multipath_hash_seed).mp_seed=
;
> > While this silently works on GCC by falling back to unaligned regular l=
oads
> > (e.g., LDR/LDUR) which the ARM64 kernel tolerates, it causes a fatal ke=
rnel
> > panic when compiled with Clang and LTO enabled.
> >
> > Commit e35123d83ee3 ("arm64: lto: Strengthen READ_ONCE() to acquire whe=
n
> > CONFIG_LTO=3Dy") strengthens READ_ONCE() to use Load-Acquire instructio=
ns
> > (ldar / ldapr) to prevent compiler reordering bugs under Clang LTO.
> >
> > Since the macro evaluates the full 8-byte struct, Clang emits a 64-bit
> > ldar instruction. ARM64 architecture strictly requires ldar to be
> > naturally aligned. Executing a 64-bit ldar on a 4-byte aligned address
> > (e.g., ending in 0xEC) triggers a strict Alignment Fault (FSC =3D 0x21)=
.
> >
> > Fix this by moving the READ_ONCE() directly to the specific u32 member:
> >
> > mp_seed =3D READ_ONCE(net->ipv4.sysctl_fib_multipath_hash_seed.mp_seed)=
;
> > This instructs the compiler to emit a 32-bit load (ldar Wn or ldr Wn),
> > which perfectly satisfies the 4-byte alignment requirement and resolves
> > the crash.
> >
> > Fixes: [4ee2a8cace3fb9a34aea6a56426f89d26dd514f3] ("net: ipv4: Add a sy=
sctl to set multipath hash seed")
> > Signed-off-by: Yung Chih Su <yuuchihsu@gmail.com>
> > ---
> >  include/net/ip_fib.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/net/ip_fib.h b/include/net/ip_fib.h
> > index b4495c38e0a0..318593743b6e 100644
> > --- a/include/net/ip_fib.h
> > +++ b/include/net/ip_fib.h
> > @@ -559,7 +559,7 @@ static inline u32 fib_multipath_hash_from_keys(cons=
t struct net *net,
> >         siphash_aligned_key_t hash_key;
> >         u32 mp_seed;
> >
> > -       mp_seed =3D READ_ONCE(net->ipv4.sysctl_fib_multipath_hash_seed)=
.mp_seed;
> > +       mp_seed =3D READ_ONCE(net->ipv4.sysctl_fib_multipath_hash_seed.=
mp_seed);
> >         fib_multipath_hash_construct_key(&hash_key, mp_seed);
> >
> >         return flow_hash_from_keys_seed(keys, &hash_key);
>
> What about proc_fib_multipath_hash_set_seed() ?
>
> It has :
>
> WRITE_ONCE(net->ipv4.sysctl_fib_multipath_hash_seed, new);
>
> Which is IMO strange, regardless of ARM64 clang and whats not.

Hi Eric,

Thank you for taking a look and catching this!

You are absolutely right. If READ_ONCE() on this 4-byte aligned struct
causes an unaligned load-acquire (ldar) fault on ARM64, the
WRITE_ONCE() in proc_fib_multipath_hash_set_seed() will inevitably
cause an unaligned store-release (stlr) fault when a user tries to
modify the sysctl. Using WRITE_ONCE() on an entire struct here is
indeed structurally flawed and unsafe.

To fix the write side properly, I should write the members
individually to ensure safe 32-bit atomic operations. I am thinking of
updating proc_fib_multipath_hash_set_seed() to something like this:

    WRITE_ONCE(net->ipv4.sysctl_fib_multipath_hash_seed.user_seed,
new.user_seed);
    WRITE_ONCE(net->ipv4.sysctl_fib_multipath_hash_seed.mp_seed, new.mp_see=
d);

I would like to take a little bit of time to reproduce the
WRITE_ONCE() crash on my ARM64 device and thoroughly test this
proposed fix to ensure everything works correctly.
Once I confirm the fix is solid and runs perfectly on the hardware, I
will submit the v2 patch addressing both the read and write sides of
this unaligned struct issue.
Thanks again for the insightful review!

Best regards,
Yung Chih.
