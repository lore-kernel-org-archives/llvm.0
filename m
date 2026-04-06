Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C1718AE3
	for <llvm@lists.linux.dev>; Mon,  6 Apr 2026 00:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775434455; cv=pass; b=UHbSnnY6mu0UMF4noc6N0yNa3q+aQn2ElkvxxamET5eMobRJiBZ1K9BVmmmN3LEsQTLs840H8hWGPlGS0RlVOOiicuJAsOKHA05BFFhcTp4to9CgCLsEbV2Ha22Esq+RTNFKRX6Fa0qg06auNdCdI3eL8bWyZvrUUIdlmGzB3LU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775434455; c=relaxed/simple;
	bh=wEpvz0SusfCyL05O+8XHZ5HBN7Vc6GU6ixNlE1n3otA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A37B4uG9wdDnUx+wGhGO9XUF7ebhmqoMc0CyHlZ9KAulMRvmWmHqO0Mzw1Os9IV/R+sqp1vi7QkvuihBYZcFuZtKhb+XzUHg3DPpjXsDsLePmdEMYt1J++Gptnr30hQOM0vtDnieF3Z1G08oGoWdSZBMyrjQnsO2HqlaSpZvk0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MVmNf1WZ; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MVmNf1WZ"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12c1161232dso2087c88.1
        for <llvm@lists.linux.dev>; Sun, 05 Apr 2026 17:14:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775434453; cv=none;
        d=google.com; s=arc-20240605;
        b=HFJlDQaCOT4giztnZ+yfrYCkWS++31qeu6AtXmHrCJiDXAbN3rnHQa4177ftxgYzXF
         8TSljyTarAPpYLmwbAma0+jvqlBA1SeBTnagXIQIawTcKeY1MhIRr3eBivD04QKzrCnw
         amdniEHob7PBSpk63AItDpzpRXuCd/LuRXW8SzcwsVlHiUPzedofyYygEje1bw3gO+TB
         9jfU0A0OhZOTkbcJ4WSJAzrn6B0LJdVgGyhOaMNYXrDzvn+/Fvwl+3ByERUAmWcAfSkl
         3xYPfxmm/8bGLjUrqTLtvY5jG85JOFndE1QwuT4NtkvItl37rt1hQRTsodLklnf9ZwKz
         WfaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wEpvz0SusfCyL05O+8XHZ5HBN7Vc6GU6ixNlE1n3otA=;
        fh=C1Rcx+pz/+D0VjfTe8KMq06SfV2DIU7LBb43EQNiaSM=;
        b=Nmf+12yANGJPW5JMwtTyJVQQ6kTAggFVZ2zr3Vz53uDX3OIDszpxq2RzGqqVNi0xnq
         ju258rBB0xsBjle4RJWF8Kg+/Hzyd3sHDLS1M6Nh4sRVgHi02aKnSkjcCIIXYjKJOJmD
         AU4rNpPU0+ZL69oFPJr/Gd2dJPQctnpC4YmhegJ94e3bAx8IaUuwXWuHey0Mq3nxLeaj
         /FaSKLYfNhLn8odEAX2/oSDi4VXJ5g29GjH8vT5Ifz0+XbG/MY0T8MI04hKLaRCvuYSU
         fJDy0t//JfqSM53L8ecZvIXzrHJQ09k2SetbNAPAS7PKolYg4IbYB5ydjYB2hOTbKig8
         pRmA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775434453; x=1776039253; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEpvz0SusfCyL05O+8XHZ5HBN7Vc6GU6ixNlE1n3otA=;
        b=MVmNf1WZRMLgccYJ38MG4x2pYvyLh0/xqf48De3i3uRTPYBBe75z9QymCksAIvnLiP
         hSCKiYLKXeXwnRHrBraF9btZvMVtoENMI2ysPL/7MbZ9QYbIL2ADhITsrnpJgw1z4Rnr
         zy8EWkxJ8dwGehcn7ziG1V8dDOLReen45bMeoo8COfT2SsVu0F/yI9Ai/O6lbQ8m1Egg
         qy4z6851+PL307jL9At4FaH8VIgXtY5DJ8qQsrNcnjE8CoS5PjFxbF6i9QN+9WjcQ+ys
         FClRiYB4TGXsfqXbxf4xlsNUiFp/tV5oD3YVgjHLZ+YGwltba3UoLvpUF0lXPgZpPTi0
         W2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775434453; x=1776039253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wEpvz0SusfCyL05O+8XHZ5HBN7Vc6GU6ixNlE1n3otA=;
        b=WlhFu9cV3tPD0A/YcQHEIYEorfqgJNsVYsFFwMWICyxTnbMIa2/bQdJpvkC2lCR+Un
         AevGPI/Ut2evwDZSeIXgYdSAMHRihqIQX5ihVIsxx1HKmsw8cvDDZE3gFt7E5HTTPuED
         awA58u0wmh5cnmx2zmq1+9tqfYi916KF4ojop9DdGF1X1eyEX30oNzq91k29QvI7o6gz
         GOZQT4DCAfDiqXqRl0R2NquTQd4KKFTi/xwQ8IEa8d6dbtqCL2ERtlui2toKDte52knW
         vYh2QdKPVhYk9IToiNr0NmzJLWXK95torjJVcav6asvlllzJcg+N+8Y5rl5HT36r1225
         0hLA==
X-Forwarded-Encrypted: i=1; AJvYcCW6wqruewt6Y6Unqq5sQ3fX4bAyCZAithWojDoLTRIlUguV4M/JT58am/QoxUUK0YIxzorc@lists.linux.dev
X-Gm-Message-State: AOJu0YyA1DFxDV5gOxdruoKA3Xp5xfGtqdqX/A6j+M8tDn3XOtUG1bmV
	NRtCgMPMsXqgxj/bmj8Jn4YFdhdq0Goomgl8y/Cces7vqaY4vJoKvVxW0vHSkgho9fd4jJUq/Gn
	qo42gd74bA8FI8Mlrd7Jc+/qBu2M8lw4=
X-Gm-Gg: AeBDies2pLv1LNeKucUihvkAD9zNS7DlKw+PDlMl3qqMGgZ4UHwfqNU7kuXXlTXdrd7
	7QQEHJYw06kj1lj/BjgvSNg7/dFXJQ3tyIDNrk7ttTQCgLE+M8rVq8m8UZV20SG5OSrDt6SNygL
	ktjJ+E+cYtcm5GuYYZsbV4ueKUx+/ziE354sv0BkHPNRMxouTgO61ZsiPM/NBNq7i3kpR1ca9+x
	5XenuzHIccneptmh4LpGWJQM7Lpa9JIma0QP+2zv17WzPe5MuMJwME7qw/50odNKMKgo+0hWWmK
	nU+won8/55XMR6WxRSHftCxM5z4Xu9IjWz3U6tUmfjamLUYdmsw2Uqr4il19JILNn+vf5eTWvbG
	pUSJmZjVU4RPgrryjdMy+ckE=
X-Received: by 2002:a05:7301:6784:b0:2c4:acef:291a with SMTP id
 5a478bee46e88-2cbfbc7dc06mr2181016eec.4.1775434453241; Sun, 05 Apr 2026
 17:14:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-24-ojeda@kernel.org>
 <177508434465.73816.4492182082440539007.b4-review@b4> <CANiq72nqenC30r7QQAmdKxS8ehGU2SoSGr+LCnoTAGLegH-KnA@mail.gmail.com>
 <DHLMTLCY6U4N.3VOMQXRIT1RFY@garyguo.net>
In-Reply-To: <DHLMTLCY6U4N.3VOMQXRIT1RFY@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 02:14:00 +0200
X-Gm-Features: AQROBzC0xKqhkvjW35MYEt1fkyhl47XKSCgdBG6b_PFaPBKsGPkzdO2Dex1iVhA
Message-ID: <CANiq72nPjz4FiYUDDV5Xw1=ychH0DrhVN88hjygBnawLf7oamw@mail.gmail.com>
Subject: Re: [PATCH 23/33] docs: rust: quick-start: update Ubuntu versioned packages
To: Gary Guo <gary@garyguo.net>, Fiona Behrens <me@kloenk.dev>
Cc: Tamir Duberstein <tamird@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Courbot <acourbot@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 2:06=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> It's still required.

Thanks for confirming!

> Perhaps having a repo in rust-for-linux GitHub org (or somewhere else in
> kernel.org SCM) where we can point people to?

...and for all these details :)

I agree that it doesn't fit perfectly within the kernel, but an update
every kernel cycle or so should be fine, I think, if you think that is
enough.

Otherwise, regarding the repository, that sounds great to me -- we
already had an old https://github.com/Rust-for-Linux/nix and
https://github.com/Rust-for-Linux/nixpkgs. Not sure if Fiona (Cc'd)
wants them, but perhaps you could reuse them (otherwise we should
archive them).

Cheers,
Miguel
