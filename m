Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351433815DB
	for <llvm@lists.linux.dev>; Thu, 26 Feb 2026 15:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772118058; cv=pass; b=Yoev4r/u1CNxbdp7Z7Wk/ETV4OKCFwMIeHjXgAwSk9xhTXYPCnnUg5Ksy7SYSHDowPzd8VysZl7CmJRrgFItUsM3F/DEpYgwVY8tQD19lxQ1g/gkASpa2xegQTWXBPaQL9ICRLhbimy6S+T4mu3F7+kWyZ/hXMyOsGb/1u3s7Kw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772118058; c=relaxed/simple;
	bh=JNnMiJju5QdanijX2DkdqzrfVYG15ENEV+hDxkyhxb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FAELQaQS7P+fAJ3YwkXuH+fIX1E31wXsrHDLqSswn4WwmmyL81o1EFlWDItFYd5Bt3pnhmGGowcYoBfeRxgnYOkMhrn5e9Z2VF1E+lzmky81nRFIdYsQpBanGdWbSil24XahmEah278rwK97BzMxZe0vh880NEvYDbhjDBqKyDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uUmnxfeq; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uUmnxfeq"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-506bad34f51so6994581cf.2
        for <llvm@lists.linux.dev>; Thu, 26 Feb 2026 07:00:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772118055; cv=none;
        d=google.com; s=arc-20240605;
        b=KPQcbu6KrPpkCsZ5ROcnncbl9xR8ws0mWzYIubjxYF5DqGldFQk8uKK5xyZ9+g/fTf
         xchaBBFtTkgtMqIcDJdvK6CdtZszRZaStEZLIrQdm1NfFob7qHe9kTb2h9EWaLLbGPeG
         GFsOsT+Nog2L381D7ZTa//BzT+t9OTxWZ+RtnNkLydpws/IjhVaXXigEUOOU5iwl0wIF
         Ja2U6gxdrnVMfqsZmUrBbry/gVKdi4vG3Y8qjE8Fhh4IOrTd1J++chCjsh6CSNbaS15g
         CDamC3+PLm/huTnV6eKrW866sHc1679430kv95kmsWmKA031Wy1kk1qyppGTLhdjkt3D
         /KDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fDBHi6yZMjrS821WY5UBSYf/CSv/xvQn58gGyI0pSxg=;
        fh=nreCLy8UfKhiWDn4EjA1E0UTHtC5CGENt94zrkPjIr4=;
        b=WC2OFTvQ1JzI51FWZo4DZG4qY7knKp5rx/p03fyg8qoUGnRAfzxK+ntWnxv/1OGlfQ
         L39TZdA2QBxq2oZFbVZJ2vQPtq7Eloe5JgxV8/QizMsUO7q28TCV9zQLDaVL7BAZJYmx
         tBNUhj4b+22BwvVjTVmaZnhBJtOKVe4ZBBoidZMUXJ9Vg4DYAoDbVpoD0YCI4svi7+Tl
         MmATFy5eURBeQIr5mcpEB0UqRmyodtm+MdMiJLJQoTOVqWwmo3FR3wRYEvm2W4nx4CeE
         zQnIveh+6GkZ4nPP4P6zI86kNsdxcbukiM3jdSx8u2PuvW4+HYgmjrUTOPJkhWObEr2g
         Vdyg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772118055; x=1772722855; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fDBHi6yZMjrS821WY5UBSYf/CSv/xvQn58gGyI0pSxg=;
        b=uUmnxfeqNGxjDfT4ChJtZSnFZpATTIggvuYfCIs7BwUEUgiBJsW6T21mDi7V5U76tj
         do9TICFWo/E8AqIQaXYJ74hdgfsv6u9ryyBSfnuOh/Zbq7MFZODPV+xlzoiS05OexqJE
         2zEcUz7F/e8Zxu9btFhubm4Faownsu4fzKax/0gtlpOW/SLnS6IZb58B6I85ckXNowPl
         8C7r+pBDZROSv9aSe0k32IQP/8QeuA/gEtH9IcakGvfHGXmxaXkvNdjUCohzV8O+ugQ8
         RwhQukci2VWwpwN8E3WRljyHqlZdQFYRDLrTfWddK6B2HjXb7QTwlcecC43R+Bb7nj5/
         E24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772118055; x=1772722855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fDBHi6yZMjrS821WY5UBSYf/CSv/xvQn58gGyI0pSxg=;
        b=I2vBkW2EpjTWFgsF8Ix0pRgQhhi+Gse6i7x8LqaILJH/AoJFibffDxPUCvRMmlQTpp
         00XW4ySIQpGmZwkjc1Bl7h2kz694zsqGIRsv5WZcFRxf4U0y1Oy5TEoVuysKz4LcBIeu
         CdDiwZFfd8EOlYh6xO+v6DZFfXQtfEQZ2MWjvBy0hvo+tr2ealA7RnkbwFIFFzmTFvWF
         EHC+MzOgExVJqX3qVuVod5VAeauDdzVASSnSUEo4js0ecLt9N7U4kiZo7bX9ofUUDVIT
         XSC0PEoLkzSW2kPaaXSini5UPT1JQe66KacL3lzY6vLs/FYGcMi3CfhAYWdQVFPFItpE
         0rHg==
X-Forwarded-Encrypted: i=1; AJvYcCXJsOXfezjgUtL9oEux8X5M5FhoyvdjOqTwAIyPQHDlsmKY22FyvZLyWlX7rYAidPIeHuUa@lists.linux.dev
X-Gm-Message-State: AOJu0YzkvkvJl7QMQMzvA37BZYk3290bqF8Fuh20M5GdT1uNA1PeKMMV
	bP7jC9mwEM2IUo9f80PZUi9gocPNnPrNelQOPVs3YCUH8qbmTaLwbUWPUwHEW+tg5es2Od2H1Ew
	xvWkvKvkGzv+4PvjAmEsJBoXySva4yGXkaO26SryL
X-Gm-Gg: ATEYQzwYWbyBkGtqpzKFW3/YfYF2bzMcdNkLeIW4ftKg/9/Rr+72N6D3W4B7B/dHlPv
	PeEOM9P3to1yU3eUeiPQRW/8nNfsu/VrkG1CJ7YcaGVx9MOfVePLrwEWdLkiFih83OcypQxsEd3
	BbTUj9IHQpaG4LvM/0zXyTSmpO6JZDhnZMmAV/69nzx2zYJ3EQnz8PRBIcuuqTz9NEaogI+OGQq
	8W/aXMR/XTw0CG5YNwjk4gvHG5AwXx3LyOaafdcsSAe+XJKZJgxhzWeeJlhU20Q/Y6FkJjFOjXP
	JxZkNCBio1+YCKU/IT+CASsHWyMVH4cPHBvcPKAyVA==
X-Received: by 2002:ac8:5a87:0:b0:506:bd04:4a6f with SMTP id
 d75a77b69052e-5070bba20c3mr311502531cf.12.1772118043996; Thu, 26 Feb 2026
 07:00:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260226111721.25454-1-yuuchihsu@gmail.com> <CANn89i+rJeZHoGna5PGWN31UGDO3jy1xx-rWs0SA23H6mU6qKw@mail.gmail.com>
 <CAPAzCqEtb9r6pP+A-RjnAKeLbHJJs3Cc3PuGcmNSR9GpaCLjdg@mail.gmail.com>
In-Reply-To: <CAPAzCqEtb9r6pP+A-RjnAKeLbHJJs3Cc3PuGcmNSR9GpaCLjdg@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 26 Feb 2026 16:00:31 +0100
X-Gm-Features: AaiRm52MxdXP-5oiz-lcB0RYshb3-sVF73Z4aiPYgg6GoJ4lwfj_lrudTwi1sIU
Message-ID: <CANn89iJH-RXQh=3ztsO1xA1uycDetkY7sogyNQTU7r2d7urmrA@mail.gmail.com>
Subject: Re: [PATCH] net: ipv6: fix ARM64 alignment fault in fib_multipath_hash_from_keys()
To: Sam Su <yuuchihsu@gmail.com>
Cc: davem@davemloft.net, dsahern@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 3:50=E2=80=AFPM Sam Su <yuuchihsu@gmail.com> wrote:
>
> Eric Dumazet <edumazet@google.com> =E6=96=BC 2026=E5=B9=B42=E6=9C=8826=E6=
=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:02=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > On Thu, Feb 26, 2026 at 12:18=E2=80=AFPM Yung Chih Su <yuuchihsu@gmail.=
com> wrote:
> > >
> > > struct sysctl_fib_multipath_hash_seed contains two u32 fields (user_s=
eed
> > > and mp_seed), making it an 8-byte structure with a 4-byte alignment r=
equirement.
> > >
> > > In fib_multipath_hash_from_keys(), the code evaluates the entire stru=
ct
> > > atomically via READ_ONCE():
> > >
> > > mp_seed =3D READ_ONCE(net->ipv4.sysctl_fib_multipath_hash_seed).mp_se=
ed;
> > > While this silently works on GCC by falling back to unaligned regular=
 loads
> > > (e.g., LDR/LDUR) which the ARM64 kernel tolerates, it causes a fatal =
kernel
> > > panic when compiled with Clang and LTO enabled.
> > >
> > > Commit e35123d83ee3 ("arm64: lto: Strengthen READ_ONCE() to acquire w=
hen
> > > CONFIG_LTO=3Dy") strengthens READ_ONCE() to use Load-Acquire instruct=
ions
> > > (ldar / ldapr) to prevent compiler reordering bugs under Clang LTO.
> > >
> > > Since the macro evaluates the full 8-byte struct, Clang emits a 64-bi=
t
> > > ldar instruction. ARM64 architecture strictly requires ldar to be
> > > naturally aligned. Executing a 64-bit ldar on a 4-byte aligned addres=
s
> > > (e.g., ending in 0xEC) triggers a strict Alignment Fault (FSC =3D 0x2=
1).
> > >
> > > Fix this by moving the READ_ONCE() directly to the specific u32 membe=
r:
> > >
> > > mp_seed =3D READ_ONCE(net->ipv4.sysctl_fib_multipath_hash_seed.mp_see=
d);
> > > This instructs the compiler to emit a 32-bit load (ldar Wn or ldr Wn)=
,
> > > which perfectly satisfies the 4-byte alignment requirement and resolv=
es
> > > the crash.
> > >
> > > Fixes: [4ee2a8cace3fb9a34aea6a56426f89d26dd514f3] ("net: ipv4: Add a =
sysctl to set multipath hash seed")
> > > Signed-off-by: Yung Chih Su <yuuchihsu@gmail.com>
> > > ---
> > >  include/net/ip_fib.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/include/net/ip_fib.h b/include/net/ip_fib.h
> > > index b4495c38e0a0..318593743b6e 100644
> > > --- a/include/net/ip_fib.h
> > > +++ b/include/net/ip_fib.h
> > > @@ -559,7 +559,7 @@ static inline u32 fib_multipath_hash_from_keys(co=
nst struct net *net,
> > >         siphash_aligned_key_t hash_key;
> > >         u32 mp_seed;
> > >
> > > -       mp_seed =3D READ_ONCE(net->ipv4.sysctl_fib_multipath_hash_see=
d).mp_seed;
> > > +       mp_seed =3D READ_ONCE(net->ipv4.sysctl_fib_multipath_hash_see=
d.mp_seed);
> > >         fib_multipath_hash_construct_key(&hash_key, mp_seed);
> > >
> > >         return flow_hash_from_keys_seed(keys, &hash_key);
> >
> > What about proc_fib_multipath_hash_set_seed() ?
> >
> > It has :
> >
> > WRITE_ONCE(net->ipv4.sysctl_fib_multipath_hash_seed, new);
> >
> > Which is IMO strange, regardless of ARM64 clang and whats not.
>
> Hi Eric,
>
> Thank you for taking a look and catching this!
>
> You are absolutely right. If READ_ONCE() on this 4-byte aligned struct
> causes an unaligned load-acquire (ldar) fault on ARM64, the
> WRITE_ONCE() in proc_fib_multipath_hash_set_seed() will inevitably
> cause an unaligned store-release (stlr) fault when a user tries to
> modify the sysctl. Using WRITE_ONCE() on an entire struct here is
> indeed structurally flawed and unsafe.
>
> To fix the write side properly, I should write the members
> individually to ensure safe 32-bit atomic operations. I am thinking of
> updating proc_fib_multipath_hash_set_seed() to something like this:
>
>     WRITE_ONCE(net->ipv4.sysctl_fib_multipath_hash_seed.user_seed,
> new.user_seed);

SGTM, but please add this part as well:
diff --git a/net/ipv4/sysctl_net_ipv4.c b/net/ipv4/sysctl_net_ipv4.c
index 643763bc214279047c90b5b92a9ba9be6c24a443..1974b826bd9451fd9d8054e1db8=
11760ff4b5a9f
100644
--- a/net/ipv4/sysctl_net_ipv4.c
+++ b/net/ipv4/sysctl_net_ipv4.c
@@ -500,7 +500,7 @@ static int proc_fib_multipath_hash_seed(const
struct ctl_table *table, int write
        int ret;

        mphs =3D &net->ipv4.sysctl_fib_multipath_hash_seed;
-       user_seed =3D mphs->user_seed;
+       user_seed =3D READ_ONCE(mphs->user_seed);

        tmp =3D *table;
        tmp.data =3D &user_seed;

>     WRITE_ONCE(net->ipv4.sysctl_fib_multipath_hash_seed.mp_seed, new.mp_s=
eed);
>
> I would like to take a little bit of time to reproduce the
> WRITE_ONCE() crash on my ARM64 device and thoroughly test this
> proposed fix to ensure everything works correctly.
> Once I confirm the fix is solid and runs perfectly on the hardware, I
> will submit the v2 patch addressing both the read and write sides of
> this unaligned struct issue.
> Thanks again for the insightful review!
>
> Best regards,
> Yung Chih.

Thanks !
