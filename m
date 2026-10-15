Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63D93B83E0
	for <llvm@lists.linux.dev>; Thu, 15 Oct 2026 22:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792103369; cv=pass; b=oyQOfXVOm3oq4h3u9u/NEH47IwxF52BK5c6kPTVvxTUExGhTcir4BawWToRLkDsxkaP97eUEiYxtFSLF1ZXtDYGcKzzt6wHr23x/SpQhRRBwc0L1FgAz+8gBiABwh2xBV9wvVJV2bnUYb2O5S8mfNB4bdrUit6DesTvDdU2V1TI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792103369; c=relaxed/simple;
	bh=AXRRS22uutXkOu3guPUe2GbkmsWxR1BXKHyZbsJzLy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TWT562wexlkLOLVi/xKODlDntsalpRiKfavLz3sM4IHi86jgl0yEZBQoijd4J0SeZOjtkAedGjulrwzZJx9pjAyMsZNbprljsJr1+jKOKsr3W3jmFUcJEh/jDOA8uJYIyLpOnz0DpWSa/4HxyUo2msgImt8dSNQrd3ZE+5lErR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d8Hmz6am; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d8Hmz6am"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-533202fe429so120461cf.0
        for <llvm@lists.linux.dev>; Thu, 15 Oct 2026 15:29:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792103367; cv=none;
        d=google.com; s=arc-20260327;
        b=gDOMcxmfRe7mbXr3aHxtyVR2eF0sibzPMWFqeWuAuiE8qUX59Z8VjgklVU8Ur9rSsP
         Df5E5VIoF/rRQAzDCKEaYLRiOjzjcJ0MJFusdodtOHINvx8lKCbP7z5CL8nZ3StMH4FB
         TXKFe/urrcWGYxACM+KRJcI7IEbZGQd1WPw09QHnus6VpgFEDQfTfkY6kIR1RXF8pTep
         QRPbs5E/9ywJJ6g5htzt66FCamH8wLhD2cdeSbfFWfFzUXZVN4ejN4CznVTNMJC+Bewq
         SOaRSfCIgkpuZEOFD8HlnAfnlzqp4HxeCZNmwwOqOvCx7ctzBKN8lYzPa3ZOoIRn/LDC
         NcNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fx0meqXkpmqmZ+T0ZUXv6LFbVHDOrz59U8bjk3O4KlE=;
        fh=uw7z+eBVjO0BlPcdmGkjeG7JO7CsbYCjV3tDOL0OYc4=;
        b=GZqnARdVA5EHTQBi2F3KWCptTFOhie+H7iGw7ebd1M8wIKCOOxtHgmOxA2U7v3A/PL
         SrfUeYnAZNTGHOp4gQWiPWLrH19xfI0SHJyGUzGfFrOmhuij6ND8/UqsjLhEDa7kqCvo
         b9Cib0iADT3DPUOK+JPJp43pxgKXVyuFI4AXkD2hXqqCHqdFJbb0L/2mYg2iL4hwTxuD
         Icl4oLjv5OMyDxd4Su6oeDIo0gOEo+C+am3hjxSWDipgH10X6Ui0+UVqyvflEvW8RsMn
         rfpIkSu5XAkGv/BLEZFdE7/fuaLauDSrmQukU49Cul3LACPdO1jjdMVdAZKnOrLdMZsL
         6UeA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792103367; x=1792708167; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fx0meqXkpmqmZ+T0ZUXv6LFbVHDOrz59U8bjk3O4KlE=;
        b=d8Hmz6ameRWSWKW63ylKFPmypAQfmYBE9zwlmqwBjEWj3y0ZPexC41DC+5Sm3tbP0U
         F+n267x2wdlM14Sd/udYOG9gQw+f/UrgfcEHTKxuvJ4YQ5eUWymhgpN+frRK+dt8IHmJ
         MQglI5stsxEv5mGbu8jLItydbJvBDgW2/nOAxzLvxZUf+QmMICvaiAT1bZGoXqpFzMbJ
         BUIo+tr70D5kjZK0JZdg3knBhe/Ro/4woZiAxtazkISnNfBl1kZZrCicVZuH4yTNAcIE
         gyq0i+3mZz4Hvei9bMh1KrYKEOXzG1b7lv1pu3nnc5HKaWOkM+HSfRRl9Ahhu11he6Kf
         EmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792103367; x=1792708167;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fx0meqXkpmqmZ+T0ZUXv6LFbVHDOrz59U8bjk3O4KlE=;
        b=cLXRrCu1z7f8tHKCrFdp5vNVVVARqdnrNm3aFWwDjrZTYtEHwZ7j8lQoUxxPOmm2VV
         hIGt3oVd5wBZ5fD2kCFYc8y/D2SjI6t2ZTGoSh6YVUEmkGUf9rKBUOfvxggU3e68E4Qg
         fz3hQB9pocylgPb5u+HnU4H6Ojh756BlDn3ukv7QvuI3G9Z6zoUMavAJ0S0RgNw8ytdh
         oKu+2TNrh9yQWZKMUkBKfDP4Wuxt2RK3Q+L2oZoGfN4n0XPIn2kXbL4LEm/PxAXdKEG8
         tmL+IYN9yP9nyCwsAKnw+RD10J8tI14OcfDilNAvaVgKpHPatJM6IdfN14luvUWeJBEq
         RT/Q==
X-Forwarded-Encrypted: i=1; AKwUvBz1+UQnL0qOO4BTmw7kZUEe1a8i9LEKGqnpPahxpL2mGU4fwZ8iVxmF1Dtm8MUroAmvnA9V@lists.linux.dev
X-Gm-Message-State: AFq9FYJIy4IIvXKnNgURbAK97C2xXsxBN5nui8E01bIB8DjrI586Gc5M
	t4iQcYCkNHNc3NfXfQiK73j++J6B2LLxHqqRBNCSIEKURcSgDVj/V//g2klWt0XzNL9EeqYZ1Cp
	pM1pXlTViUrOVv9Qskm4Bte7Df+x6TwqToiHShxZg
X-Gm-Gg: AYBFou0AjU6VU2DSd8mnh/rGD26p0/zBSzxNpk1N9Qbet1A9OE23zIEK9fqMek0X7xO
	LVZ5AHmPUfZOZsRhCaGsfkcq3OWq5431EkzSt9ihaVbVXI4O93h2IfVElJ4+XaZxFPgHvHRijZE
	9ItTixt/9luNG2+Ka29L6w2toE/BXRrUIuxEF0O8fX1haBuErcggNOB/PymzjpjR0wDZFiQCd4K
	D7baCSRLkQROhElKdfqI7J0rIcODkMlY+BI8DLuzJpBRPR0qTUEvUpdjGHvnpWv/3D3Tcf8QhTi
	aK89anM/wwhI/XUB9SkQj+s2+V8+coAHC7efD2CKKyKx/jNve4C5uI6/MpG4fBUxpaKq7psB4o8
	5RXO0U3jbDQ==
X-Received: by 2002:a05:622a:1a89:b0:535:30a:76c7 with SMTP id
 d75a77b69052e-536297d3336mr5010261cf.3.1792103366183; Thu, 15 Oct 2026
 15:29:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261014225811.i.852-kees@kernel.org> <20261014225818.3457479-2-kees@kernel.org>
 <2026101517-profane-opponent-4523@gregkh> <CANiq72m_iyquf4Lc8AWvbsBp++ASz4+C_MQ5iYQW-fHd_MNDxA@mail.gmail.com>
 <C46E97AC-3722-4264-B541-04EBC3091E00@kernel.org> <2026101532-fantastic-deafness-e04c@gregkh>
 <CANiq72=wS5NJyeKKaYiHKWhDq2Wjk728qkCUNq4xVoHrPEPCRw@mail.gmail.com> <2026101515-oversleep-related-e4dd@gregkh>
In-Reply-To: <2026101515-oversleep-related-e4dd@gregkh>
From: Ian Rogers <irogers@google.com>
Date: Thu, 15 Oct 2026 15:29:13 -0700
X-Gm-Features: AclHuK_bhqpBXC-6cMMrPjeFLsPs6nuRXrMV9IFwDJ4QNHEyGqQj-Q86H0SV0Zk
Message-ID: <CAP-5=fX72cGXtOVYFK0Fr-XMWtr5nfmdr0y3dwVeUcuAueW3Xg@mail.gmail.com>
Subject: Re: [PATCH 2/2] seq_file: Require explicit initialization of struct seq_operations
To: Greg KH <greg@kroah.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Kees Cook <kees@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-fsdevel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 1:50=E2=80=AFAM Greg KH <greg@kroah.com> wrote:
>
> On Thu, Oct 15, 2026 at 09:47:34AM +0200, Miguel Ojeda wrote:
> > On Thu, Oct 15, 2026 at 9:11=E2=80=AFAM Greg KH <greg@kroah.com> wrote:
> > >
> > > __must_init might be smaller?
> >
> > That sounds fine too. I like that it says that something *has* to be
> > done (like the original name did). Hmm... On the other hand, I guess
> > "must" could sound like one has to initialize the field "somehow",
> > i.e. writing:
> >
> >   struct S s =3D {};
> >
> > definitely initializes it, yet the compiler would warn. Would
> > "explicit" hint a bit more at the fact that one has to actually
> > "write" the field, even if it may have been initialized anyway?
>
> "explicit" is a description, "must" is an action that tells the reader
> what they have to do, so maybe "must" is better?
>
> Anyway, I don't care, naming is hard, either is fine with me, I'll let
> the authors of the patch here pick what they want :)

Fwiw, I like __must_init for being both short and intention revealing.
I'll hold off sending my v2 for kobject::release to avoid renaming the
attribute.

Thanks,
Ian
