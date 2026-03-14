Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2C022A80D
	for <llvm@lists.linux.dev>; Sat, 14 Mar 2026 11:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773486946; cv=pass; b=SlWnBpg+dgCZdF3U9Ijhx5TZQDv2cfUsGj1p/8Dh9gljWkTSoTJQbIdkhN1GryjbecGdMXx9zGW10IvBeFJqK/sIix5CXjKNqxrLFU0mRole0GQ2PerQTgOjBkq37MczZfycPKYqndrQN+PYVSnPfc6SxvhuORccCfjaX7enXPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773486946; c=relaxed/simple;
	bh=zcMk2juHKP2RohK/1BK8E8XwH+Ave8HercTkx4NfKUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GogbVAnd3GjZNYpo2g6+TPYgVkLRFRmlLSiRMQcsSCLEXm1vqEpEq7eyUo6u7fPXHvTniln3mWpgAVU/57tVCwWOu0KfJTZtaBTEqxJkDLh/30eetIpoUuSkZngyWkRp/GyhgpDEfJMtYYND49lqysVwBpXwIkqQe+JLp+lozPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GrPbZxyR; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GrPbZxyR"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439b78b638eso3194894f8f.2
        for <llvm@lists.linux.dev>; Sat, 14 Mar 2026 04:15:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773486943; cv=none;
        d=google.com; s=arc-20240605;
        b=fcDEuYjuRBL7rdhavXGG43K34JxTvuxRmzpdAQVuZPayt7B33B+70RBP4K2UmdD2Ng
         G3k4Khq79d0a9YXFb+mnU+xBxVGmb/TKbWGM8L2uWa8mAO7aKekkItIVfQXTfgbMBAEr
         nwfWnxNf0utXaCf5UsrXnIWXO1bShG2S5P0lKj+Ej+PXcLuR1C/oQTZSaytcG8xKjJWa
         e8Fgw7sruiz6yFYm94kZ1KgczIVPbxr/vfGHCUzMhU6f5Enzd/dg8xkYn5RKJieqpJmF
         y/iOOrrKy3WiE9En5/O74zQ/kQ5qgweRBX38RZTmmRgXW4bCpezVmRBpFD8Dhcmn3W+c
         ePwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zcMk2juHKP2RohK/1BK8E8XwH+Ave8HercTkx4NfKUI=;
        fh=U1qzvzSdRYlOnJHLc8+wbtDxvSLEZeQnpak5K3jwwcI=;
        b=Lkm+TStLU8OPycjn+uzfRb+SAv/4MvZarGddbTJBbSAKA7YYcKqrKmgg6vPa8Zy+jN
         7EBoVsOW54D/XTN7pFdRgOtKnB8iiwYnDOdPVS92WvuAmKrmsWGc4hG8TLK75DV6ySsR
         LtexzgvVYoGRnkTA+j9XVJxmuPxt4vokL9+HBPr3mGZPVlk4C3DqrhXS6K3NayEBZ+5x
         WfBRa0NlXi5GRvISm/ZhoT15NZnj4+u/bT6uboZU0XhmI8LBmlWBtFOX6lWeEo9CcKYf
         sUVETlE78u4TPodoWR1/NLdn9Mz2Is73R2rlB345ODg52eCnid086cKn+Z/h/YbbyIGV
         oCpw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773486943; x=1774091743; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcMk2juHKP2RohK/1BK8E8XwH+Ave8HercTkx4NfKUI=;
        b=GrPbZxyRrBJHLots6+Mx+g3PfAWZuHtk72o3FXD0syDU59+b50Hr7/fSqv73jGaF0R
         PGFpk187neOMsAxMcVyhCoJZIEjKlkeneouQfLSfXiwLrtrrnXQVFtNfW6lIFyqzNa7n
         sQGDzrNfEvNhxLRqCdi7CJkzY4J3uAfVm7YKU1DnyBjMt6RSwKeZf/BR/9ulwWytDtoq
         MVctddAr8cChV8da7pzuLrEOOoydeNCt/EuN8nBrTDv+8Sy8U9cPiSPTxEK01SbDKOGm
         OWBpdEtdSrNNcuB/77bktUFa1Gn1PvYde/kVUGWc9JYl05n1L2O2kfJiq8ye1wPfZF3h
         5K8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773486943; x=1774091743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zcMk2juHKP2RohK/1BK8E8XwH+Ave8HercTkx4NfKUI=;
        b=oaBHyLZonz46U1Y03eEyKISP7Tmi0lDz2jozH2iVn/W4L7V3Y4K/CahnQzGUnEwoA9
         WUhNmNNLSBpVS+WyxdWklqHq0EgY2St7m4OuFGEqpEzgZ3RZQZLcn0IlTKd15aS/UCdp
         Ve9ctcTCptguJIaMnBv05Smob5UqutXDueulhZ7oW7Ptho2x7vWiW0+W9TcNp7SSp4iZ
         FPe/6DTewsW9ImoZLyWLHd+1/DYnvWcDA3VGXElBcB45soqtnq+mK8boElyb3PlAP2yZ
         BPoBsYWHtXEga6rJTLpwkK9YFDlV4UU10oQDa6ZyfvuxxqEXQWrWMF0TcuN+UsS7E9t2
         Bsfg==
X-Forwarded-Encrypted: i=1; AJvYcCXyj3KWn4g5sGNz0xCb433s/7RWJ5T74LH9HR+oHgZqcPAxmkKEreFyxvAOW47lAMDWHiQO@lists.linux.dev
X-Gm-Message-State: AOJu0YwBkqQsI1FAsJnRc1LpVDAnywvaUGf+9imtdcej2L75mtAP48Mo
	sS3qQ9KUXoZW8kNOcUNispYMEpp9p6kjxpx7oMn94D1SuJ+fDWscECxiuj5y98kGriEBiFS4naY
	Kok862evopJnXpu9gGxarpSqRQ1A1hjUVLrT59F8J
X-Gm-Gg: ATEYQzzXQM4tbLQAq3HFxj1ElYdyP7bMMlMT/GJ731kuNfpLxZkZj3MqbcDZGbeffwU
	kD/iJbCsVHkRGTE7lQjArRgJu6ybKdc29DOsCsrGbUh6r64TByidGtED1alBmzKYQ1OKDuzR8su
	RoY8BuATry0sm61pX8ieq4IjOgKavwAATgpItgHage8zr6jBX4sZO20EdIyP7HP/LMjcJJtO0hm
	Xwl7IQ+ov5Y3LcwA+Zatr5Q0fPGWfugI5Ut1ITV/U46g8aoQvdwI8hvVIAMtAL14VyIzhtdyn8Y
	jcrfIjvQML/FZ+vnB96J9iP7hEtC1p35FtXu3g==
X-Received: by 2002:a05:6000:1ac8:b0:439:bc79:9f8f with SMTP id
 ffacd0b85a97d-43a04d14d83mr12829860f8f.0.1773486942418; Sat, 14 Mar 2026
 04:15:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202603121235.tpnRxFKO-lkp@intel.com> <20260313213638.GA147391@ax162>
 <CANiq72mzEzjNg7O_2dWT_6QOJvJ3TwV+HyxNd_F4j6v9C+pc7A@mail.gmail.com> <2026031422-catsup-rectal-f886@gregkh>
In-Reply-To: <2026031422-catsup-rectal-f886@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 14 Mar 2026 12:15:30 +0100
X-Gm-Features: AaiRm51ckUfgkRssBsogIj0VIQkDe2Z-Te-pFSaEkqjwee_TzN5cwYkr8WTmMWw
Message-ID: <CAH5fLgixE9MGXxNEnU5b0EXdgLQoTs5CMv_0OdnfCX3v=coUpw@mail.gmail.com>
Subject: Re: [linux-next:master 5585/5731] error[E0277]: `*const
 kernel::bindings::vm_uffd_ops` cannot be shared between threads safely
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, kernel test robot <lkp@intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Mark Brown <broonie@kernel.org>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jann Horn <jannh@google.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 14, 2026 at 12:13=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Mar 13, 2026 at 11:39:14PM +0100, Miguel Ojeda wrote:
> > On Fri, Mar 13, 2026 at 10:36=E2=80=AFPM Nathan Chancellor <nathan@kern=
el.org> wrote:
> > >
> > > It looks like this is a conflict between Alice's "rust_binder: check =
ownership
> > > before using vma" [1] (currently in char-misc-linus [2]) and Mike's
> > > "userfaultfd: introduce vm_uffd_ops" [3] (currently in mm-unstable [4=
]),
> > > hence why it was bisected to the -next merge commit.
> >
> > Thanks Nathan, yeah, adding a raw pointer (not function pointer) to
> > the struct makes the type `!Sync` in Rust.
> >
> > I assume this is best handled with a patch on top of char-misc-linus.
> > Perhaps creating a wrapper to assert it is `Sync`, since the
> > `BINDER_VM_OPS` contents are unused (so far).
> >
> > Cc'ing more folks related to the commit.
>
> char-misc-linus should get merged into Linus's tree "soon" and then we
> can fix up the mm-unstable change for this.

I'm working on the fix as we speak. It would be ideal if it went into
char-misc-linus, because the commit that is wrong is mine, not the one
in mm.

Alice
