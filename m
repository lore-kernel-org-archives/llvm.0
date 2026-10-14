Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C055E560ADC
	for <llvm@lists.linux.dev>; Wed, 14 Oct 2026 16:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791996274; cv=pass; b=aMNzeN5Yn3sgzheEn3dvf2Jki/fy8OnQ3QtC0ywzfs4lcu2FA4+ZHnQ+hqstd2kUVJVrlfD37l6w3c5b/5RLbvvzx5MZiPpf0n6ZJcLdjyCFLUs5lEdXF2qWUKhJ0bZFlWh8pYSgFY5jEhaQEFz7wwlOGNpngjyiKx/I/9JVYjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791996274; c=relaxed/simple;
	bh=lG5fR4/c9rTkKwB+dH11HXxHn5DhiwcqDirk4k17QlI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uBDomy56JEj/XYTvkoab6gapc5MTyaHl2+H8UD3EJi86JVzxmOxNMAUYGAqrBlhaj30CNaDYcwv2RTJXSJE0j/11xITf9XmsZsVBOMZF1hmkMXXe2gK+rBg7mZFjGrFZ5uOnb0ZICl+iJIdITfWrG8xtxYaLB3vwPEmisJSk0LE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VBS4jdS5; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VBS4jdS5"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33e623bd651so514496eec.0
        for <llvm@lists.linux.dev>; Wed, 14 Oct 2026 09:44:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791996272; cv=none;
        d=google.com; s=arc-20260327;
        b=WplVdErAnAA3Y3Nx46lSg/p4H039a6eYfypRfPqmZgO/MjueR1zhIdLpjeCbApu/Yo
         lfeoLzpxs8ILx8IhKFr+E4Mk03ffjfyJnIhmz5Kk/52ogbCFbJe1f10GOQLlKiq63aae
         iouIFJ+MVZerRr6b2qzvO4FOm9DuaKqGUvUBlUVBJsa4L1HMjGA2X9UvG5GPHYG0oUEB
         n5ZJzpFrhzV9VtExb7UixEPwQjiTHHSVr2k5DWW+BBEhgHJoEWYaqMX1eEYCGEa9fKCm
         PogUljq42LvEruV8eSYtNDqtQia0CAsNqjhrl5hArkxISn7IEyrim6p5pspmMB1xUBX/
         zmoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lG5fR4/c9rTkKwB+dH11HXxHn5DhiwcqDirk4k17QlI=;
        fh=KhnoDyJ5O00Y750dwVhsAvP2BvxY3dWZ9gdgd2wIddc=;
        b=nMwREOZK+3ujDo6I/ZtJbtm8KU6bof9a0aw7X7RVwZLhoc24sm5v5toF/4ljF870FY
         89+3KCtpZ5km0M3Ey1h7tbtaA84VxI888LaK0jw6DRdTH2RZlW/haeOPOx1VCP0/Lmn1
         peXu5rHgPF0NeYfiNCM9fuux4ua2jYY/9krFqLxR80PxBIk6/UdMCt8mwi5TwhS1EGqn
         DGjngAKldNLDWyzlfycm9LaULVsc+kUDRdeI79+/wYJbbeuVhfNS0S7jQElQ4j3sazOL
         rwn6SGyzXCsmS7scB5SX3zfyH4KZRP7iTVclFFwaY5Lq9XoRvzCm4KMC12BeX5hKU/nX
         MLTA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791996272; x=1792601072; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lG5fR4/c9rTkKwB+dH11HXxHn5DhiwcqDirk4k17QlI=;
        b=VBS4jdS5WV9790zJVyEB8TzU8ZrMJfWBiLp2perKzjibEIRElf2PVgFKxBoWwkE1Tr
         27FPX8tZDhOTxCKppFz28Z8JIQb8PCiQWJNMWrZrKt7bCIj2a83pUxT5fmw1A9bQl6yH
         gu0emcSoJdxQ3pCdzmMYyxw5ehsbV6OYL6ac9/dSUIEUb0hQBys28MvZfV+HrrNvwBDr
         aBw/eBi6vRxFl26eH3stZ0PpclqWzDkVc8kbAvKiFkKVg6xjKCv7UbFlfdh7/etwxY8j
         m3ifU41cSiLL6+6wT6CHtBo/p18D87qZ7R4Ko0TOj3RiPFB0y2oOkOxadlZmbRSSgAws
         +EXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996272; x=1792601072;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lG5fR4/c9rTkKwB+dH11HXxHn5DhiwcqDirk4k17QlI=;
        b=EdVm8VsM4DI22wta+gDCeh5Kd4erw5SRGP/P9bUDcij85F2dO709EPnFa2h7GPLolv
         mG+w4Eyt7vGV9T8yzyg7++kBXdKvNRxpfMt70FKQ/xS6DuY1to36tuGp3uPgCKf5F2o2
         nKxYqtl1+zIxf0Wxswod7uXzCSCfva0dal+WRdWOS8PECq+fzWbkcW7hgqDQHMDgYFEy
         MvnQzEytqdqfva+eMhn1nDEt3vCJrP3T1KRga4YspAuWn5um2/qp56Lmk6mR7wcQBQyg
         PKuDQZuF/BlwKLueXa05qTZZOcao01wNEi77uPt/oswYBJW+WmCF8fO9XfG6fK8SQAYm
         h0pw==
X-Forwarded-Encrypted: i=1; AKwUvByi6GNy5x8f19e7uPYG0MWl6aRkhJ3C3UAAIOqZ8OJggq2zxCJ7KjsTOPKTzGp92aITiQPm@lists.linux.dev
X-Gm-Message-State: AFq9FYJBFOkyDVKcUGgGF+8rdDMdAxa4EwrA8ElHvHZ923GTLkDunI+O
	KmZJGXi/3yrmoyWMNaiNN7YMi7O4nVeCv4SSYdxvxi+kQpKBEj1MOqbH3/TTNQW/BR/a2sVbsaW
	Pn1JhMnpW2R+zuvKPb2s3W+X1ANj3w8M=
X-Gm-Gg: AYBFou0LTWzhj+14VZMp5YjaSnS4DNUVfSD2RIO4dEwkTa56IGSjV10ORoexniXT3tT
	7Q0fDwMnBF9rkke3mgOkz4yQGh8dRr2CoYC215ar4wlf73lwI8QzVyCDaUY0fZICW0c7TEAlXCc
	TirbjzkIgcmBvwHoplvxTF9O9vzJ5ipi3qvcw7ZHcz8VmpmUFXtdqPeV6kvhv3gXqQCqbZMHWro
	UAQZwRU+34RafH/8EcbPO9Seg8AMtai/FLb59ryP8Hz1BLJpMwviXKp2zGsEXruNKfe4N092HuX
	ldDK8BMQ8K1A4uTgzFMdCsPiWCCkic9oZFuReJ9ricqtOfZxM5AkSwcWzLUclQ24yj0A8Jh0pJl
	k/t7bGq80O9U2xGoUQRNNrxLQLk8w74R78uRPH8hD6Q8QySRQQrUPqI7tv8+ftGkv10EPlnb5fm
	u0iiFzmnqhGKOaGYiFuVvTppwua9cp7pP2GQpg2N2dewBg4cskULw=
X-Received: by 2002:a05:7301:5413:b0:358:c9f3:b055 with SMTP id
 5a478bee46e88-358c9f3b260mr28158500eec.1.1791996271702; Wed, 14 Oct 2026
 09:44:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com> <2026101425-why-boring-4f2d@gregkh>
 <202610140932.5F9CFCE5@keescook>
In-Reply-To: <202610140932.5F9CFCE5@keescook>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 14 Oct 2026 18:44:18 +0200
X-Gm-Features: AclHuK_d31yoge0njHjovdIQh7JfJY6W-PLjzMLBq14NjY-schAqigzEJUAQwG8
Message-ID: <CANiq72=4WQ1B1oCSW=69u_Z=FFLE56hYCqDwWr+poQdzSTS31A@mail.gmail.com>
Subject: Re: [PATCH 00/11] kobject: Require explicit initialization of struct kobj_type::release
To: Kees Cook <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ian Rogers <irogers@google.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Viresh Kumar <viresh.kumar@linaro.org>, 
	David Teigland <teigland@redhat.com>, Alexander Aring <aahringo@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-s390@vger.kernel.org, 
	linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 6:37=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> I'd really like to have the attribute available, and I've got at least
> one user I can apply today that don't require fix-ups (seq_file), so
> if Miguel is okay with it, I'd like to snag patch 1 and send it with
> my seq_file "first user" for this coming merge window so it's available
> starting with v7.4-rc1, and we don't end up needing to wait 10 weeks for
> other subsystems to be able to use it. And the kobj fixups can continue
> in parallel. Does that sounds okay?

Of course, please feel free to pick it up (with the small tweak I
requested) if you have a user.

And if you don't pick the user, I could still pick the first patch up
through the compiler attributes tree if you and other folks want to
use it after -rc1.

Greg: adding the attribute itself should be safe and would unblock
others that may want to "protect" themselves, without having to wait
for every potential user to get fixed (but of course I agree they
should get fixed -- we should not forget about them, if that is your
concern).

Cheers,
Miguel
