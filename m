Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBAED529
	for <llvm@lists.linux.dev>; Fri, 20 Jun 2025 13:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750424551; cv=none; b=NP5+xLFlOdQZUWHiVqxD/XWfJtCy5zSGZGgJY80HtkAWEr1ao2aZoZbYouFt9I7wIEjP7MFOeLNCZR4MwIhcWVcbczkaUBXHe+w5rlt344d8lKwVuSraP47IxiKH/jw5zi9PdOUP5J1RjNgnrIWrwZwSWqQQLqGPHsIR5LG/S9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750424551; c=relaxed/simple;
	bh=+i9CDQP6n8E/ducjtDiDPCYXDGSXpqP+2tp0/1XCQ2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gY2K+1525qPe2bBm9q1XUIv94RGl3zeYO0WpLdOAOwv/+OWDFoKpr3JN6aA6t2FaVKMqDKKc0t191wiA7johxEnF0ZD2I1FWddHBCJhb7l52Dd7XA8Y7lQ8pCdiwYppT/80pnpd4cT3A9tCIpFBZXbE/sVx24l7SRB/6JM755Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GL4hEqVF; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GL4hEqVF"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-31308f52248so283802a91.2
        for <llvm@lists.linux.dev>; Fri, 20 Jun 2025 06:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750424549; x=1751029349; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ku2lfCRgbeEeQyv76fdpFPbrXssOkC7jN0SIcPzFmHU=;
        b=GL4hEqVF9NSM9LA9qDFh/kQbCiqX9/0xocXKQ13pR1K2t89lKsYnAJaptnOLu0EZxB
         IhzB4xT5wRZ8xJZKpeATmCOFYmdz+PnuFpUcrXQ2FQ2vCTDS+jzXB5mQ/XohdMrybsJr
         VZo603RsI4WrWxIXPQWgJ/Atj2ycjnG9oDUOT9Yjw2uXZgEBNJliwQX6RE6CjXeySGNE
         WDYc+PjGO0/U+Q3NcXWQDWanjK7h3mtK+lHX6a5oyQnyJrv5TZR7UMm3HXzWg6qilB37
         J9vI9x++MlDdlqMOGix9dkADSF0NOJaYMbytExYyltSOg3yP7dc4N66ogUlzyynzlFbK
         qJTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424549; x=1751029349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ku2lfCRgbeEeQyv76fdpFPbrXssOkC7jN0SIcPzFmHU=;
        b=n+s2JHhCqXD7Pk9zOBEOm8gdvIVMtn1LPnnqsfoojihs6en/dOBH8RioJCoCXT7hEp
         2wNosyaK1haOnLku9OQIheM4n+tcwnasVBN/4DB0vUvIMlZhFIKXgN3PaD+EuEfKozaY
         YoQtNQdy0mPhId2dwZPQ0MQW2NZtlW/wDr5L0ierb75m9erm4MzWCLf2uvbhT150Jx27
         FiEZwYbMBuC6rC55DnhH+tdA6+G61BNcHQbPtqbU8Sv2CKyeA8sqjqUTLN8wvR0/WxdD
         G8vhClxCfuGP2cVBVp+ojapZQU7XcB3tOwGCq3cFoq0dBiDpBMjmXHTHTMjbHtOGbTjY
         ZozQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeQvlSKy+eEpgMLLGDf6hq5cjsRiWJMvxQwabj1ljFo9TipW0UQmZ6zBTussx/s8jlDT0I@lists.linux.dev
X-Gm-Message-State: AOJu0YzTFVcUywIEHD3fV3J5kNRB+5q2YB3b0O/xmzkSzJ4x2BqApfBV
	pSjvzcqWAbzDbTU5AdWjCX44Q3H2rrC3rJF9r0HTL463/Hj4cgiUIiD/gwQvRXJTVQ4kq2QkQBT
	25hw+5Edhje93Jk0o+GJbmXVAxqrR8aQ=
X-Gm-Gg: ASbGnctliTYaZOPVBoMAVZymkqnt0hwgz1+WzJf+Zzig8nCeHJwkT4ltldIT7KBjIPF
	PXO9UidzdwTCGsGOEZkEjzuyiEFvOOgq2xYyR79aFMMOnJjwGG1nA8uRiGEMgwe27TAU6mefIf4
	yAZ+MdRkWfkBOxZCf1pmm90p0eyx8g7nfqKDLoveBkxrA=
X-Google-Smtp-Source: AGHT+IE8+NT28jJ3PDlhzDgK6jrsUDzmmjw277/KOn1Wu4vcAf7wijjDZ/chmH3fOdcVRrI5P8Ws46tamOa5k66F32k=
X-Received: by 2002:a17:90a:d64f:b0:312:1ae9:1537 with SMTP id
 98e67ed59e1d1-3159d577d0cmr1554310a91.0.1750424549428; Fri, 20 Jun 2025
 06:02:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250620111406.3365763-1-arnd@kernel.org> <CANiq72mYSPA_S6hT4B2U8Sgt2QTJekuVEKqjJDgQxGVmMX64jA@mail.gmail.com>
In-Reply-To: <CANiq72mYSPA_S6hT4B2U8Sgt2QTJekuVEKqjJDgQxGVmMX64jA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Jun 2025 15:02:16 +0200
X-Gm-Features: AX0GCFsaglna8IdmCTzw96MKy8HtUl8_UV1WmceqB6-05WHmIviXXgc-IkSlcZg
Message-ID: <CANiq72kfUWYdssvxOS52D9W3fLN0xQRHNwYGGduSGHrSGu+YEQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: change __retain macro for gcc-11
To: Arnd Bergmann <arnd@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Tony Ambardar <tony.ambardar@gmail.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Arnd Bergmann <arnd@arndb.de>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 3:00=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Is something else going on?

Ah, I see -- it does error on arm and arm64, but not x86:

    https://godbolt.org/z/G4Pbd9Gar

So it is architecture dependent.

Cheers,
Miguel
