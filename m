Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6743D0A4
	for <llvm@lists.linux.dev>; Tue, 19 Dec 2023 21:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FNLC4gEC"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-78101c35ad4so65778685a.2
        for <llvm@lists.linux.dev>; Tue, 19 Dec 2023 13:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703022838; x=1703627638; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uorEIJa1wV7XcN84uUF/pYn1OAptdc3n7/u41DV37lo=;
        b=FNLC4gECqE707LXfe9Rg1TTn82GqNCBi90PQRSIUgorofXNG9MjxoVEnOrgukdQJK2
         DqyavCj5QC3A2i1U3oysrvgtxKXJOoASTx4pZUCQCD3rDpsq6QtkQSvcmjZwpicIxFre
         RNAb+QS+EK9S1C6DEx7VKAwz3KGv4TozgY93hahCIfOsT56zwc7Z/aW/4c0lSgF32M7C
         nSLHer8aRYBORsQazTdalsbErvFMZADr3l/UcGUG6GN3+NVxVD4aNsKv0vZwtIc+iCOq
         YVBzMbIfgoS4W8HUeD55t8h/oEPxrPeo6HyNmXU2i99SVibF9nj6Pj+sxtOlaWqMCrGw
         LNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703022838; x=1703627638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uorEIJa1wV7XcN84uUF/pYn1OAptdc3n7/u41DV37lo=;
        b=KTiUL06pe2GNENFMXu/eEia1tcWAy3M/xTlRCx2lRHmKKSf3u+wHMs55XZuCy9MwU9
         xDerxfAC1y8+3tDB2VLfo8T5ivJdiZORokDhxeX2PXxNLjhR943szz88J719jdLxR41W
         3vm/pHxS1rmNO2wcOVGxsfaXojuOjvyEWTpLhA+6gIq8T0Dsd5bZ1YMlDw/A7P7CP0uj
         g1TCvfHpfN8/H2+8+dWYOJ93Fc4d50LabsOtF35eAl//lhr1VKn2xGtVZJ34jPjL/wkO
         neFvTu3TcBLqbE3wwCQnmxvkTDUwi+l/oGUiWEFJA1JOR7e+Od82N1HDFjm97TK5Wt4O
         0EWA==
X-Gm-Message-State: AOJu0Yw2HLYr3Q0yiAh2bxe3jH486znhyr+ncKgttYQ/dHKlKcTQBo9E
	WHzRyCDP9xYKuAEuD9OIkm3sDocUo5+kUdssbYY=
X-Google-Smtp-Source: AGHT+IGVPnDmY+8hb2F5TdHpkLPk45ReDmKcW3M5DxmIqEZDxtJbur3DLguyhg1Ml6F5fd55X0PrxkRtZRmV13wCLiY=
X-Received: by 2002:a05:6214:1416:b0:67a:a496:4a39 with SMTP id
 pr22-20020a056214141600b0067aa4964a39mr18464073qvb.18.1703022838662; Tue, 19
 Dec 2023 13:53:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231219-libstringheader-v5-0-206d4afd309a@google.com> <20231219-libstringheader-v5-2-206d4afd309a@google.com>
In-Reply-To: <20231219-libstringheader-v5-2-206d4afd309a@google.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 19 Dec 2023 23:53:22 +0200
Message-ID: <CAHp75VeLAip50O9YYcgX7nceYc4JpWjYX0aAve0sT7KkMNR0CA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] lib/string: shrink lib/string.i via IWYU
To: Tanzir Hasan <tanzirh@google.com>
Cc: Kees Cook <keescook@chromium.org>, Nick Desaulniers <nnn@google.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Greg KH <gregkh@linuxfoundation.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 19, 2023 at 8:48=E2=80=AFPM Tanzir Hasan <tanzirh@google.com> w=
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

This LGTM now,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

--=20
With Best Regards,
Andy Shevchenko
