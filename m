Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93EF1847
	for <llvm@lists.linux.dev>; Tue, 26 Dec 2023 18:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J5AYV9Dx"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3bb9b28acb4so2066209b6e.2
        for <llvm@lists.linux.dev>; Tue, 26 Dec 2023 10:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703615702; x=1704220502; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fe6llAStBJM+lU1hroIelESFyF/1TQequyrsL42KNrk=;
        b=J5AYV9DxM9Tr9JqLHIgtoDKJmXGs543RWuepyBunUPmJoH6wRG2+4kEeyX26PxYtfe
         7nYkLhgjBD6p8pJcMsPRbL/8DyiuHzgxs+mlV9cEbBL6Nd8YqZ2aYjNd9vaXBbA2FVJg
         WIIdLl8xWORYPuvs4VQQFwDjLAxItM1cjD+umF1E0zY9feUUNDPCNyUSplwZtv6O3zab
         q8eaQOllL6Y0XOJUAxRAfzTfbKywrZdU59u8RCondzQwmjqGUOo/R/1vUKxKU3PRvihX
         N2/JMNSXFJJxkZaUouhowq4dpE4WbvRFF8rhlbAYmCtE/F9I1jY+th142ibLoOxOGH7i
         5y1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703615702; x=1704220502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fe6llAStBJM+lU1hroIelESFyF/1TQequyrsL42KNrk=;
        b=hWleM8QEN0kN8JHk7VRM/CMJoeNQFb7kIlpoHI56ysF5tMJ//ANNamflVclyRddUP/
         /J/Wm7Ec/bKuifNX5fJUi3Q+md6oyxlfpBvXFQmjvfpwo6oBcu38JCQ0mkY04aO4ar5V
         KxpMUPuERAeUJHq4cb6DQkUKDAMONHnGfhU9WkWlNuoxKW+h2ttX4f/Hr5ZrfPHpLQFt
         CUwQI5jk9U3FJoi3vYbNOVlmsT0/5uQPP5mta3dHlB7SIiPS6C1KcZBA+ntczdkO5VeH
         UuOhZ1zJLJWk+TuJCqzCG5N130droWRCQjKqC524BLEfFX5Z3ue8YznKUPk3BGekRidU
         d5wA==
X-Gm-Message-State: AOJu0Yzts5Iqlx7aD5R+mG2DwsAd8b5r+Hi3PtAOQVIUAwOqr2jR1+Bw
	l+Z+uNihvz0f1c8JTUNF4USfutLnyteMtpN4Yik=
X-Google-Smtp-Source: AGHT+IEjC5hlnqkV+nRSxayldzoAFGJrlA6lBfARIWvwxPwaD84cZV1GvejDnPIofYh+Rr5Ud+s4fNSr/8mt7Vdxbw4=
X-Received: by 2002:a05:6808:3309:b0:3bb:ac46:8c6 with SMTP id
 ca9-20020a056808330900b003bbac4608c6mr2952343oib.18.1703615701822; Tue, 26
 Dec 2023 10:35:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231226-libstringheader-v6-0-80aa08c7652c@google.com> <20231226-libstringheader-v6-2-80aa08c7652c@google.com>
In-Reply-To: <20231226-libstringheader-v6-2-80aa08c7652c@google.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 26 Dec 2023 20:34:25 +0200
Message-ID: <CAHp75VfXWev7Z-tHRPAuWzaLj7ogiECW2arFc4CdcxUE87Ld0A@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] lib/string: shrink lib/string.i via IWYU
To: Tanzir Hasan <tanzirh@google.com>
Cc: Kees Cook <keescook@chromium.org>, Nick Desaulniers <nnn@google.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Greg KH <gregkh@linuxfoundation.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 26, 2023 at 8:00=E2=80=AFPM Tanzir Hasan <tanzirh@google.com> w=
rote:
>
> This diff uses an open source tool include-what-you-use (IWYU) to modify
> the include list, changing indirect includes to direct includes. IWYU is
> implemented using the IWYUScripts github repository which is a tool that
> is currently undergoing development. These changes seek to improve build
> times.
>
> This change to lib/string.c resulted in a preprocessed size of
> lib/string.i from 26371 lines to 5321 lines (-80%) for the x86
> defconfig.

Why did you ignore my tag?


--
With Best Regards,
Andy Shevchenko
