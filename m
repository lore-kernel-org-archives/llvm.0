Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72329326948
	for <llvm@lists.linux.dev>; Tue, 10 Feb 2026 11:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770722983; cv=pass; b=ZEZyKmgOOApDGcn5MixJUF0G2IGPN8GQx8X4az71E/sH8Xct88FEoMUUky7IRt2DxbRgFv+60W/+duTaF6AJkOsocWqAnnLUjTI7g8gUz0GCqwX3LL7IK23lYP1ZHuSeNjSGtwATeNDDtwZCd59kvE5j50lCfPdHXZ16gP+8ZxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770722983; c=relaxed/simple;
	bh=j3nx/ajXEqDdK9tPtrbxfG/uqfq2Fd5vN56+LqjmEiA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n6dqMoJUosUHPcdPg86JQRVkm3iWkwsmMMaSvSj+PtXYwoS3q9vLuFku+X7yxV0NWRy5THh5uy8to+cJry1oC6QnBfB8F+tqntAk/u7sXGIpOpuPOJjY2rwIuDd0YOJPFhTXVCO/AbMvvMOwQFAOH/AutRmkdidUERInTR640G0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EZQUkfY6; arc=pass smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EZQUkfY6"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5eeaae02888so1354814137.1
        for <llvm@lists.linux.dev>; Tue, 10 Feb 2026 03:29:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770722981; cv=none;
        d=google.com; s=arc-20240605;
        b=Pp+eeKmsALwxgfFbiLbo6wz+2K1pywhQkaaWjMzhv9zjhwVXvlumPxPLuJg9K5AqRq
         85NjciiCL9WKQiDtwbVUhYkFWCxRX0V2ofLvQw8CFp2lJuHvGoT0QLH+Qvy2VzW7ZRMz
         x03YYOuUAeL9GARZnp1PCrM+Ikvq6rCGZ5IPuPFULqrhIvKDcniPComzHGqGWlh4FnDf
         WlnYHjyfhh8uE3fJhmpu4RqcJGdHbejvDBsyleYQFF+qZXqZX0UCUpKNHOuWlNdl+vRg
         C7S06iYSmMNaMLb6CXKqXHjLYL4m8rC/NVBywUaW7Ytf/jMhG5qBEMfF7yM9LFrt/IX2
         uEmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j3nx/ajXEqDdK9tPtrbxfG/uqfq2Fd5vN56+LqjmEiA=;
        fh=UtYBBJzAwsYGRD7dPaaBHIMkrkyLCOK0M5r8MLJiiU4=;
        b=jtLy3ODmRICh0gt3SdBvzG5iN0GJx97vfWSdiHWLw5hiVRK6dXad9bwRzENkdxy74l
         T2cxQGYz1fSGbRvraV7kYs0NaefQQL3da9aAnPeh6vN2LVOzGDKqgD7RiXU6gqItnCX4
         o7MgIq+MvHTJhLNhHPZKZIo7ILvhPTyv5lopPYvhqjZe+zccx1+UQYtPYjt55FrF+QEn
         iO9R3xFrw7m2VcqbMAGF63M50FPCCD6EJ39gNbXcf1HcfeaoLOCBlyrvs7/dE7+inlZ1
         SHbH22Dj3zU22Ijl01EWCK7D6qPsy+zo88uKPXUr6Hos6DGRRBraDI3ucX2eEZ9i/ttT
         394A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770722981; x=1771327781; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3nx/ajXEqDdK9tPtrbxfG/uqfq2Fd5vN56+LqjmEiA=;
        b=EZQUkfY6hxsjSgsUd5yPM+DIhcMEZNJuwRwvP+bf93us+ADWzh88FMgi5Z0LsxXY+G
         gjEE0qigkmNKid53vF7qs+IDf8vJO1xKvEBBHs7jAomwUbqfLMwpdKGqkvvW+f3kDKD7
         Q5POJeevG701ZCZtvqv9kOdwSdxexAA8jDibCW8zVbbsWzTNhhhZWLquSGavUgyoctAC
         aVK5JIP2YD91StLiGCNhqj/DTfZQPjfM/kdONjldboeDvlKEcmwbu0cj50VYAQvY0w83
         Zi30QWcjbm/CGOpun76lpIoRxiIxXUApbtuBcyH7JcatJW8rhNkXyuj7LXUnTk8ZhaBj
         n91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770722981; x=1771327781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j3nx/ajXEqDdK9tPtrbxfG/uqfq2Fd5vN56+LqjmEiA=;
        b=uCkGgm5kbsTgEXCxbSIjW9B6C2vFL6Lxl+FkRCly6i8mKD5qoY72A7zpOjzD42uROc
         7tUE/zI771P3+avJjrvsE/v80E77mhrIrtPUKy50yR5DeQdU9HEjbam1grvAmOUUbiOf
         GZKh6gztG4kf3NRmjQVvb2ucuyjTw11CiBppe4LUGJFI8mqxhmVMrPymXJvLIxCKCGaI
         lLQopfCQRpkBJok4kHwnyLyOzyI0Tpih7yr8RpK44kPzVGEyHtC1E9WaYqDqGb+V2trB
         boLmoA1ulKNDjYFd7oHlicrBjkKBFsz8kCv16DCx1N0TRb06wGCaA1OjXo48beeApJRk
         Kogw==
X-Forwarded-Encrypted: i=1; AJvYcCXR0+ujomj2HxuvWcMa/5Rv1Nx38AqgtjcgBgPE1qSA68mmCLewWUHXHxwdycD6KHy2gy0i@lists.linux.dev
X-Gm-Message-State: AOJu0YzvDBA0/CFHd/JjEEL0ElmaL1RdcrR3j+tRs9qoMKV1nnjJIzgd
	w7il1/VU19GMQhQ3KVxB5j8CZCfXrLbMNYqwLWJuO0t0sghwgs/UhbS/AgdnDsuv5wLJKoycd+q
	Om7gqDexIP6Qea61RfcyAlipBSRIImpoTFVPGEc0=
X-Gm-Gg: AZuq6aK4DWytvFEy5UDpHpiqdQRDmMxT81HABKLRz3MNWklsimfpnpS8g4V+q6Bxfx1
	FgU76j8vo3fSGetEnJF6UlsYBHtiN8SxYRMe7Bsgi1BFBz6HXAgNUwQX3eBWVRbgmkkJxudf5TX
	JdKjzpPmOnxab80IJe0HcCULPUvMk8lkfw6LLRj5mbaZ5954dpPinfOfr3YInTwVkPEBcpH0Ha8
	A4lRj4Vm7m+tsjVFFTThYp+9TeB5ZUlX0gNxa3gCFBWCcv2hOuGvYWu/Pz9t1msE6abxZPmseHd
	XBW3/cpNuu/6HbSYGiO6kBF0Z1r8F+DEQ/EAgbogPcFZsJ3x0bQcagnTkWc=
X-Received: by 2002:a05:6102:4187:b0:5de:93bb:c53f with SMTP id
 ada2fe7eead31-5fc48df6ff6mr403676137.25.1770722981155; Tue, 10 Feb 2026
 03:29:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251121193957.1655580-1-morbo@google.com> <20251121193957.1655580-2-morbo@google.com>
 <d29ca795-ade3-454b-816e-46b5815a1444@app.fastmail.com> <CAGG=3QXC7EH18mhJq6egqE6bvo8_KchPD_N4PeZ7Z7tLOv26-A@mail.gmail.com>
 <a4c3494c-5444-4cc5-b847-4e1754bf3d20@app.fastmail.com>
In-Reply-To: <a4c3494c-5444-4cc5-b847-4e1754bf3d20@app.fastmail.com>
From: Bill Wendling <morbo@google.com>
Date: Tue, 10 Feb 2026 03:29:24 -0800
X-Gm-Features: AZwV_QhncrCadRnYVezoNaR1hRSbJWzPQVVig9dQWodD_Oj6H6DCBbQYrzvwC9g
Message-ID: <CAGG=3QW0Hs7DdNh9Zt1g3LgdrFGi9POKuhOETMPbe-a2=gvp0Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] Compiler Attributes: Add __counted_by_ptr macro
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Marc Herbert <Marc.Herbert@linux.intel.com>, Uros Bizjak <ubizjak@gmail.com>, 
	Tejun Heo <tj@kernel.org>, Jeff Xu <jeffxu@chromium.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	John Stultz <jstultz@google.com>, Christian Brauner <brauner@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Brian Gerst <brgerst@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev, Jan Hendrik Farr <kernel@jfarr.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 3:28=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Tue, Feb 10, 2026, at 12:00, Bill Wendling wrote:
> > On Tue, Feb 10, 2026 at 12:41=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> =
wrote:
> >>
> >> This is every use of __counted_by_ptr() in linux-next at the moment.
> >>
> > I assume it's a git snapshot of GCC. :-) What does
> > `scripts/cc-version.sh` produce for it?
>
> It shows 'GCC 160000'
>
> I see my mistake now, I tried to build the lastest snapshot
> but accidentally checked out an older git commit on that
> branch, which didn't work.
>
> I retested with current HEAD now, and that does work.
>
> Sorry for the confusion.
>
*whew* I can go to sleep now. :-D

-bw
