Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D636381AF
	for <llvm@lists.linux.dev>; Sun,  5 Jan 2025 23:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736119577; cv=none; b=aOro4FeNmasuTQFOmX3fNPKHQ3kyNrcnlXR3BHG4cUhlsadSokfqRwlZv/8JWegT0BBJvveXFKyiUoJr3aOkWkrE6WfvgVmPc9mdwlzVGrzhMEnF+r4Fq/C8P4xNruv+46upnsaRoRUyqo3LOuQimwepXPC72OkAoPOvybcU1bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736119577; c=relaxed/simple;
	bh=7rhACLPYa6zrhtNIbntw0+Wcposv67yPIXB4CCHibtE=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=XWuZiWTs88jzwV+H9UPB8CKMyFda9o7zw/bKE4FsBGP8virK9XkAj679Asary5Dx0Bdz8anqSoE+s8ulYfKEZQ/JJf5FHlWwlXUZ4rqVdhIiYcrAQ/f/5O6h31KrFJqTLu4ASWO9MC0v8Qp75Yl79SPPQn91Fa/5h1ZTowTDPec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lRaGAgZT; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lRaGAgZT"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3ebb2d8dac4so7700609b6e.0
        for <llvm@lists.linux.dev>; Sun, 05 Jan 2025 15:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736119575; x=1736724375; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0ECpIFIKltWeXSgfqPd3+YixblViapulEUWk4IC4AQ=;
        b=lRaGAgZT9R6ohpDeT9c9iqGvcbmGtWBy+HsMukj/Q2PjVbx6NqakOClM3KRESlFmMH
         rTfkyXIf0Etl2odgyoDP79fVcb5mVnKQzq/vtzyBrc/XDz6vZ+ERqDRMmCmoU2kjbMc2
         c+qbv7fAxWpFdW6bn01v5mkAhbWtKiX6U/A19Nn7OuQar1XQZwZ1EMRXiPgM0gxFanLa
         AdPYLpqKNkmbjeL9MXN8erJE8i6pyEC8X5RyraRnBUGQUkJVdwh8sxW1Hvll4vOtih4E
         R9Yk1yprTvPRqu6zUEg5FOG1B9Npy3Tvp55i3nOWPixyuARDz4QU5yVLflMjjHG0kws5
         nvmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736119575; x=1736724375;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q0ECpIFIKltWeXSgfqPd3+YixblViapulEUWk4IC4AQ=;
        b=R+0DJksfQTmWyUe8KkT+aCmqWRjU15/j8FF16avdoH8yTrgYLgrZ+vNSv41Rm9TQKu
         oZ7JB3IkQVGFi4ZxKQz+i3gF8ReaZCXZFqy6LXmoK2fJ+BRcWRvQuq4pfmZeeuGaWFpL
         ip9QVWNZrxKLfq242o9O2QoO9BGNBJA35EuijMtqTpxGKXTrL85CS54dycK0g5e0XS/4
         0zHCTO7aa8MaO7WZAQBlxlJdhgatjhEX/a1lvzmypyf1cgZOXPJeUP70awZKP+reOMqK
         DpCOU8vACp+CxZkTeEho2flCnF0PLqoOOgDbiiv0y2sifO49zl4fEziDCWCObcBfMUZ+
         ZEFA==
X-Forwarded-Encrypted: i=1; AJvYcCVjkNg00+kLFubj/d4HYKAp/D2qED9cXADBUdCQZEYQ20RuTcLCRKSPe2veGvnNuLL23IR6@lists.linux.dev
X-Gm-Message-State: AOJu0YwV8/G/NY7kz0ZmdnOG490LNTMO+5143XPxCRLR3oF0PKfi+Dpm
	Cmv4mniNWq6gHqLXCE+vCJVJTOO6T8+cUg3f3/UAYLopfHICmYhO
X-Gm-Gg: ASbGnct/e3ZslRf73kjfZXl5AsuK5DKTAR9kcjbhDfCgHsdbVj6qj+A+bngbE83a9dA
	vdiXWHiX7S8QCuDordPylCmkOtY10zyOK6MiAURtJFCYsXzfMXbVobZbJAEKVr3DpHyX+Q6J/Qu
	sT9wdgIId1Tobwl2Cxe/iTy/YDjnvtYGGkAupZEMM0WsMSdzoWJbsQM98IWDr0YvXf7TGBbpqOw
	G7MrqzMlO3wXPly5a95N6eE0vHgsw0fIiUmEVjxt0UUI2qYjzbWiGK+Z1W229NfkBD7aw==
X-Google-Smtp-Source: AGHT+IF9WY9LXPItu4B0zNMvCVw+rcPI8wvPC9vNyZ9c/PRVPKF+X1S/xpE3/XCqk8/UIZNSWsIJ2w==
X-Received: by 2002:a05:6808:1305:b0:3eb:6044:5a8c with SMTP id 5614622812f47-3ed88f86c06mr32231463b6e.20.1736119575376;
        Sun, 05 Jan 2025 15:26:15 -0800 (PST)
Received: from smtpclient.apple ([136.62.88.244])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3ece251f667sm9810838b6e.31.2025.01.05.15.26.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 Jan 2025 15:26:14 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [RFC PATCH v2 22/22] selinux: restrict policy strings
From: Joe Nall <joenall@gmail.com>
In-Reply-To: <CAEjxPJ7NdTWu4dspY9cbPMtRsW_jERoRbKBsObbvsEnwgmZ8Ew@mail.gmail.com>
Date: Sun, 5 Jan 2025 17:26:02 -0600
Cc: cgzones@googlemail.com,
 selinux@vger.kernel.org,
 Paul Moore <paul@paul-moore.com>,
 Ondrej Mosnacek <omosnace@redhat.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>,
 =?utf-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>,
 =?utf-8?Q?Bram_Bonn=C3=A9?= <brambonne@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <EF4B3759-2C4C-4A15-A721-6B2D0FAFD84F@gmail.com>
References: <20241216164055.96267-1-cgoettsche@seltendoof.de>
 <20241216164055.96267-22-cgoettsche@seltendoof.de>
 <CAEjxPJ7NdTWu4dspY9cbPMtRsW_jERoRbKBsObbvsEnwgmZ8Ew@mail.gmail.com>
To: Stephen Smalley <stephen.smalley.work@gmail.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)



> On Jan 3, 2025, at 2:12=E2=80=AFPM, Stephen Smalley =
<stephen.smalley.work@gmail.com> wrote:
>=20
> On Mon, Dec 16, 2024 at 11:42=E2=80=AFAM Christian G=C3=B6ttsche
> <cgoettsche@seltendoof.de> wrote:
>>=20
>> From: Christian G=C3=B6ttsche <cgzones@googlemail.com>
>>=20
>> Validate the characters and the lengths of strings parsed from binary
>> policies.
Excellent idea.

>>  * Disallow control characters
Fine here.

>>  * Limit characters of identifiers to alphanumeric, underscore, dash,
>>    and dot
Fine again.

>>  * Limit identifiers in length to 128,
Fine again, our longest
 - type is 51 characters
 - attribute is 31
 - boolean is 46
 - role is 12

>> expect types to 1024 and
I don=E2=80=99t understand what this means.

>>    categories to 32, characters (excluding NUL-terminator)
One category or the whole category string? A single category longer than =
7 characters seems pretty unlikely and 32 is wildly short for the whole =
string.

Joe

> One option if we are concerned about breaking backward compatibility
> with policies in the wild would be to make these restrictions
> conditional on whether the policy is being loaded into a non-init
> SELinux namespace, similar to:
> =
https://lore.kernel.org/selinux/20250102164509.25606-38-stephen.smalley.wo=
rk@gmail.com/T/#u
>=20
> That said, it seems hard to imagine real-world policies that would
> exceed these limits, and likely could make them even smaller.
> But as Daniel said, we should make them consistently enforced in both
> userspace and kernel, and potentially these should all be #define'd
> symbols in a uapi header that can be referenced by both.
> Looks like you left the type limit at 1024 despite Daniel's
> observation that CIL uses 2048 as the limit, but as you noted, given
> the page size limit on the entire context by various kernel
> interfaces,
> this is likely fine.
>=20

