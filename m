Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E61617B4F8
	for <llvm@lists.linux.dev>; Wed, 10 Apr 2024 17:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712770451; cv=none; b=MbH+F956l3X4bfDuS5Fv1tPXNVBKx6ueLWSDLgMQE6UIHXZ7BWjffQrgocDHRuc3bULXRVDr8gIeEY0NVjcHXD/WattBskPpu1I3td4SExZZywyLW67qYD+PwnPbgkZGpMki1w37OoV9J8u+AHyesPu+VNdnxOx5JvMUQpnV7Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712770451; c=relaxed/simple;
	bh=JdPYH8zXzJjCy+9t2t002gX792kNQ6LJClxLBlf8XAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S5lzvcX9hV1WZxtYFwEn8hmWP+dT/HJN0uJSjoIsqa8rjgYMwsceYWPFNNcyWPsG8iTGB9vK01bjwjcerbm+ivoNDikJcKTlnJVRapLhcxRW+QiMVT8OZYFV9wvLfzt7fXEoCc+G/cGFfG3bGHup0K/uuygyuocAv5zOyT6+MhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uaFYF34m; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uaFYF34m"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56e2e851794so1087a12.0
        for <llvm@lists.linux.dev>; Wed, 10 Apr 2024 10:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712770448; x=1713375248; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24S3Bg+rcESNRT2cXFvXR7bglB21qtrQn/+dYIrwVcs=;
        b=uaFYF34mgUt/f0PwBDKCIB654H9hs4PDJR3No5zSs+mRhSgsi2yfFmmzL6gWJIfG28
         O49unNzuNL3WY7tjB5YQD76g5g9C1fzZDJyCHiY6GDFATn7MdX4pM21VYjJzcaC0u1MB
         bYKmcIYmYoEAw2TLjHnvXZ4JVXY4b4mQTwaZ3QYf1M0R9uW0FlDgp9RRBcpTVgsqheGt
         IIKwTTkceBfJDA/yvK0/1gMIdPuJ31kpBohvJ0XuRmT6KigvqRcycnLRA4UbFJ5a+LVG
         JKu88KA3Rr1HryuAs96OFp/lD+2JCg4L41b3ET2uYZPligeQJH0st3Y67F88rKy1f67u
         Zbdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712770448; x=1713375248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=24S3Bg+rcESNRT2cXFvXR7bglB21qtrQn/+dYIrwVcs=;
        b=PtyHdml0kD6nPdJAGxcIQQqdWkW3zEX2JfsOw8qfGN+yQ+o9zi/bERSoSzOw0tfozr
         edXRjI+WA6dXm+Eho27BTZ73gpSOGLHZsUsQToFPhIlcGB9HcV7eHy37j5eeFXulSON/
         9sT/da/PW1rW7+igQqiOHVJKbVva2SJvbVeIxvW5ssDm0CYRb4UUtbsU6+65MNSF8e+v
         Hcq1jdDqdpmF4s2H3X7qc9EStw15vw233igD1ZZiC//9Ewqk7p62Q6cRYqwQdZ7Uo/tm
         CxDbv4fHRS38o0edVmobhFr2ewAKgyVhXTE757H0tE4nEPWKDQVA04UolM864sD6C0Kq
         VWsw==
X-Forwarded-Encrypted: i=1; AJvYcCXZ+ryGYBjOYkNmegO9rNkgxgu1JwqMPZjoU4J4YqyvxeMM7flaIJ3oLLlR9DIK5c6/vPVSYIFW+8Bf9XQcxcyEPoEPZQ==
X-Gm-Message-State: AOJu0YzqJh3JUXa4qq+gsJyNI1rkmJ+l/X5xB61dB/bVEES/U/8lEAaj
	H4oGzYNwm7MXmeROcV7ZrVPW3XSVBRsVHv7Nhh1+hq1w9z47dZpc8pmReF4643fGQSTC021JzQq
	cawOXTTmOgUMhNMvS+zRGn2YT/N838mst7I/j
X-Google-Smtp-Source: AGHT+IHwKZj9oiU3oRdw6YKYrDV891dVli+TzPT9xQvC/me3PFqdqWwwMbeMDWlvcwENE3/ToQALhQMOxXDDEn4giRA=
X-Received: by 2002:aa7:d753:0:b0:56f:ce8d:8f9 with SMTP id
 a19-20020aa7d753000000b0056fce8d08f9mr167166eds.3.1712770448176; Wed, 10 Apr
 2024 10:34:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202404082207.HCEdQhUO-lkp@intel.com> <20240408230632.5ml3amaztr5soyfs@skbuf>
 <CANn89iJ8EcqiF8YCPhDxcp5t79J1RLzTh6GHHgAxbTXbC+etRA@mail.gmail.com> <db4d4a48-b581-4060-b611-996543336cd2@gmail.com>
In-Reply-To: <db4d4a48-b581-4060-b611-996543336cd2@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 10 Apr 2024 19:33:54 +0200
Message-ID: <CANn89iJMirOe=TqMZ=J8mFLNQLDV=wzL4jOf9==Zkv7L2U5jcQ@mail.gmail.com>
Subject: Re: [net-next:main 26/50] net/ipv4/tcp.c:4673:2: error: call to
 '__compiletime_assert_1030' declared with 'error' attribute: BUILD_BUG_ON
 failed: offsetof(struct tcp_sock, __cacheline_group_end__tcp_sock_write_txrx)
 - offsetofend(struct tcp_sock, __cacheline_group_begin__tcp_sock_...
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2024 at 7:28=E2=80=AFPM Florian Fainelli <f.fainelli@gmail.=
com> wrote:
>
>
>
> On 4/8/2024 10:08 PM, Eric Dumazet wrote:
> > On Tue, Apr 9, 2024 at 1:06=E2=80=AFAM Vladimir Oltean <olteanv@gmail.c=
om> wrote:
> >>
> >> Hi Eric,
> >>
> >> On Mon, Apr 08, 2024 at 10:49:35PM +0800, kernel test robot wrote:
> >>>>> net/ipv4/tcp.c:4673:2: error: call to '__compiletime_assert_1030' d=
eclared with 'error' attribute: BUILD_BUG_ON failed: offsetof(struct tcp_so=
ck, __cacheline_group_end__tcp_sock_write_txrx) - offsetofend(struct tcp_so=
ck, __cacheline_group_begin__tcp_sock_write_txrx) > 92
> >>>> 4673                CACHELINE_ASSERT_GROUP_SIZE(struct tcp_sock, tcp=
_sock_write_txrx, 92);
> >>
> >> I can confirm the same compile time assertion with an armv7 gcc 7.3.1 =
compiler.
> >> If I revert commit 86dad9aebd0d ("Revert "tcp: more struct tcp_sock ad=
justments")
> >> it goes away.
> >>
> >> Before the change (actually with it reverted), I can see that the
> >> tcp_sock_write_txrx cacheline group begins at offset 1821 with a 3 byt=
e
> >> hole, and ends at offset 1897 (it has 76 bytes).
> >
> >
> > ...
> >
> >> It gained 20 bytes in the change. Most notably, it gained a 4 byte hol=
e
> >> between pred_flags and tcp_clock_cache.
> >>
> >> I haven't followed the development of these optimizations, and I tried=
 a
> >> few trivial things, some of which didn't work, and some of which did.
> >> Of those that worked, the most notable one was letting the 2 u64 field=
s,
> >> tcp_clock_cache and tcp_mstamp, be the first members of the group, and
> >> moving the __be32 pred_flags right below them.
> >>
> >> Obviously my level of confidence in the fix is quite low, so it would =
be
> >> great if you could cast an expert eye onto this.
> >
> > I am on it, do not worry, thanks !
>
> Also just got hit by this on an ARMv7 build configuration as well.
>
> Jakub, I do not see a 32-bit build in the various checks being run for a
> patch, could you add one, if nothing else a i386 build and a
> multi_v7_defconfig build would get us a good build coverage.

i386 build was just fine for me.
