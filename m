Received: from www17.your-server.de (www17.your-server.de [213.133.104.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5147210FB
	for <llvm@lists.linux.dev>; Sun, 15 Jan 2023 10:54:49 +0000 (UTC)
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www17.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <thomas@m3y3r.de>)
	id 1pH0HM-0006mM-Hc; Sun, 15 Jan 2023 11:30:20 +0100
Received: from [77.185.92.28] (helo=[127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <thomas@m3y3r.de>)
	id 1pH0HL-000JFs-5T; Sun, 15 Jan 2023 11:30:19 +0100
Date: Sun, 15 Jan 2023 11:30:17 +0100
From: Thomas Meyer <thomas@m3y3r.de>
To: linux-um@lists.infradead.org, David Gow <davidgow@google.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 =?ISO-8859-1?Q?Bj=F6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>
CC: rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 linux-doc@vger.kernel.org, kunit-dev@googlegroups.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, Wedson Almeida Filho <wedsonaf@gmail.com>,
 Gary Guo <gary@garyguo.net>, Brendan Higgins <brendan.higgins@linux.dev>,
 Daniel Latypov <dlatypov@google.com>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH 1/3] rust: arch/um: Use 'pie' relocation mode under UML
User-Agent: K-9 Mail for Android
In-Reply-To: <20221217044436.4138642-2-davidgow@google.com>
References: <20221217044436.4138642-1-davidgow@google.com> <20221217044436.4138642-2-davidgow@google.com>
Message-ID: <387962BE-A8FA-4D35-9905-30D3685E38AC@m3y3r.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Authenticated-Sender: thomas@m3y3r.de
X-Virus-Scanned: Clear (ClamAV 0.103.7/26782/Sun Jan 15 09:20:34 2023)

Hi,


Am 17=2E Dezember 2022 05:44:34 MEZ schrieb David Gow <davidgow@google=2Ec=
om>:
>UML expects a position independent executable for some reason,=20

I think I did add this to make UML build on Debian=2E=2E=2E

> so tell
>rustc to generate pie objects=2E Otherwise we get a bunch of relocations
>we can't deal with in libcore=2E
>
>Signed-off-by: David Gow <davidgow@google=2Ecom>
>---
> arch/um/Makefile | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/arch/um/Makefile b/arch/um/Makefile
>index f1d4d67157be=2E=2Eae321282dc6f 100644
>--- a/arch/um/Makefile
>+++ b/arch/um/Makefile
>@@ -68,6 +68,8 @@ KBUILD_CFLAGS +=3D $(CFLAGS) $(CFLAGS-y) -D__arch_um__ =
\
> 	-Din6addr_loopback=3Dkernel_in6addr_loopback \
> 	-Din6addr_any=3Dkernel_in6addr_any -Dstrrchr=3Dkernel_strrchr
>=20
>+KBUILD_RUSTFLAGS +=3D -Crelocation-model=3Dpie
>+
> KBUILD_AFLAGS +=3D $(ARCH_INCLUDE)
>=20
> USER_CFLAGS =3D $(patsubst $(KERNEL_DEFINES),,$(patsubst -I%,,$(KBUILD_C=
FLAGS))) \

--=20
Diese Nachricht wurde von meinem Android-Ger=C3=A4t mit K-9 Mail gesendet=
=2E
