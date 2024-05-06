Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273A51DA4C
	for <llvm@lists.linux.dev>; Mon,  6 May 2024 17:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715015775; cv=none; b=iS1CiHP9x813o7dP6LCJ1QNstd/0mc3SEfnTwamWpwSMTic2y3sAo3MhpeneoXC9uki3fKhvHgKPZKECYAVun4kbxRQwM0Lx24TYbqOCOD++7vEBl5+Os8VUPbpJ45LpCo91QxgS0xMZSZKxaJt9KGi9VG8uRG7bddSwfTD76m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715015775; c=relaxed/simple;
	bh=CH8+eM4S1n20YyEYWl0xkpP7fPFGyFDj7hZD+iuKZ+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RbMvNr6OtCaS3DqTXK/YiKMe33WuyHqJ/Wf9dT296zIm56keZ6CGSDQLlMBi+xjC9MLIwvQldQH+CPwp8GVFx5kf+a+x8lBHy60J5171hRXNycmecF6kjSeC/rfEAblUBK12zgJ+gcL6N6nlrJPobwv8xI2CAI/T7VoTR05s/O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gYgV/m6B; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gYgV/m6B"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dc236729a2bso2243269276.0
        for <llvm@lists.linux.dev>; Mon, 06 May 2024 10:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715015773; x=1715620573; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KofGXFo7s9xwEHva7ZrVmJtjldE1ogFbG7iHwKVRDOA=;
        b=gYgV/m6B6+1daouHwZzoWaJd91kf0e/2zYZkCnwYHVv9ghkeOWwaAfkwD6bGLMisbX
         jRAFD1ImHZq7yWwL0lxVk+UygqhJdvXT3OIATXmv3he4mBJlFlu/HnIgBnCndd9UGA1g
         0Zkv4oZlDf4RCfnqjOlk45WyzeHNMxWZB+NsvhmD3dAgg6QbOhqlQJeIhyOVEsK/qyO5
         htagwpcenxprAHSfXIOaTncL2cxl7kuXfdZtuFgdnYqGlzQemvHu0U5ijlrDGCo/8/vv
         I9LXOMaohTn3hRtIULibYs9xLEDqzuzIRR1DtpPbaw6DF9aLreL9hIt69/khSc8F7nEK
         XTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715015773; x=1715620573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KofGXFo7s9xwEHva7ZrVmJtjldE1ogFbG7iHwKVRDOA=;
        b=u81HllA19OL37pbXVEbSHa79OUKWqrl97WbqvXsVKvvw5T8gPHES1y680SksgFnmmu
         jzRBOLuEgBYy0sSwS2w0szvpbXZAdnktPg1DvNpbaSNVpBiLJBwbNnzMXQEqTgLeuocF
         bdek+Yau0C89Sx9sbFfYa9vZQMbXTuV7722cjO+S10EnoNGxfIesAp5Ga99rQENCU/gb
         NDtrSkEAfteD3J3EKy6gPwEs+EK+S4PU1aM2mzHjXjK9gq9t+A13LAOIB+9+DMLGiOBF
         a0P8FhSnZyA1TX21qW2r3h8EcdYjoT7UnNFBnuRNTnMx0+Jp/39asD2zdrhjyQ6j7qKf
         LbJg==
X-Forwarded-Encrypted: i=1; AJvYcCXpSu+DQChyT44pYlGHM9W7QK7fwCXAzmjYlIyJq7lImwMBIWiCprHP713G5dJGw6kBJ96JV12jpEsv/niEQUmEZj/+fw==
X-Gm-Message-State: AOJu0YyF3nVR2SAYqtbilyINDj0FR6mNJC9WjDSuTykDbf8u6aQiFekf
	p7z6qZonS/uybCTcfStqP4hqwmk+Q3O6bKhAEWL5HHzDpJTjA41INU4rvzLSycmM5vb1BTrOfbM
	lxC461WYG60Tboe2Qog9IcnkS+9V2QiRpcCr+
X-Google-Smtp-Source: AGHT+IEzpiV/fRSpmds6fIDkQinopcpDSw1n1WY0/LX7bnm5aatstSpU5088BhxTIMAs0gqkQJ3SCI0XZ85AoTU9WjI=
X-Received: by 2002:a25:204:0:b0:de6:4ff:3155 with SMTP id 4-20020a250204000000b00de604ff3155mr11865643ybc.16.1715015772984;
 Mon, 06 May 2024 10:16:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240501180622.1676340-1-edliaw@google.com> <osgrbhnqlyh5yw4y4x6wjggx56dogsgje5yy3mkpu75ubs3zwg@5tliydzky37k>
 <b55272cb757743548c789aa8c0efa448@AcuMS.aculab.com>
In-Reply-To: <b55272cb757743548c789aa8c0efa448@AcuMS.aculab.com>
From: Justin Stitt <justinstitt@google.com>
Date: Mon, 6 May 2024 10:16:00 -0700
Message-ID: <CAFhGd8rAW4Mkctq5VkcfVjw_yr=jVdXaWbYXP-vmeVpw7q4ruQ@mail.gmail.com>
Subject: Re: [PATCH v3] selftests/vDSO: Explicit unsigned char conversion for elf_hash
To: David Laight <David.Laight@aculab.com>
Cc: Edward Liaw <edliaw@google.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Andy Lutomirski <luto@mit.edu>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, 
	"kernel-team@android.com" <kernel-team@android.com>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 5, 2024 at 6:21=E2=80=AFAM David Laight <David.Laight@aculab.co=
m> wrote:
>
> From: Justin Stitt
> > Sent: 01 May 2024 20:55
> ...
> > > static unsigned long elf_hash(const unsigned char *name)
> ...
> > Is it possible to just change the types of the parameters of vdso_sym()
> > or does that trigger even more warnings on the callsites of vdso_sym()?
>
> Isn't the problem the definition of elf_hash()?
> A '\0' terminated string really ought to be 'char *' not 'unsigned char *=
'.

Right, although note this comment just about its definition:

/* Straight from the ELF specification. */
static unsigned long elf_hash(const unsigned char *name)
{

which indeed matches [1]

[1]: https://man.freebsd.org/cgi/man.cgi?query=3Delf_hash&sektion=3D3&aprop=
os=3D0&manpath=3DFreeBSD+7.1-RELEASE

>
>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1=
 1PT, UK
> Registration No: 1397386 (Wales)
>
