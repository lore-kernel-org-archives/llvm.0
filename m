Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B87B6D38
	for <llvm@lists.linux.dev>; Tue, 26 Sep 2023 07:43:35 +0000 (UTC)
Received: from omf11.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id CA9F0140761;
	Tue, 26 Sep 2023 07:24:01 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf11.hostedemail.com (Postfix) with ESMTPA id CB4CA2002C;
	Tue, 26 Sep 2023 07:23:58 +0000 (UTC)
Message-ID: <f0de36d5f8f3687c873616ac3bae698f2aa61020.camel@perches.com>
Subject: Re: [PATCH] modpost: Optimize symbol search from linear to binary
 search
From: Joe Perches <joe@perches.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Jack Brennen
 <jbrennen@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, Tom Rix
 <trix@redhat.com>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org,  llvm@lists.linux.dev, maskray@google.com,
 cleger@rivosinc.com,  kernel-team@android.com
Date: Tue, 26 Sep 2023 00:23:57 -0700
In-Reply-To: <CAK7LNARd_pRWWso49C4MoahFAM9idyOFC+9ZFYdpS87CA4UTqQ@mail.gmail.com>
References: <20230918210631.3882376-1-jbrennen@google.com>
	 <20230925205933.2869049-1-jbrennen@google.com>
	 <CAK7LNARd_pRWWso49C4MoahFAM9idyOFC+9ZFYdpS87CA4UTqQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: CB4CA2002C
X-Stat-Signature: y9s3jquo39tzmxs37yi73zyeiazbpeb4
X-Spam-Status: No, score=-0.10
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+khqWz5TU1xoTnJNYXZ46+Dt8aB1w98N0=
X-HE-Tag: 1695713038-119367
X-HE-Meta: U2FsdGVkX18QhCLbRGcDW559Kb8YTNrEohGutUbc4O+Pvg+b4aqU91yYlhADoZCgd9f/jp28+UHLUpE4ffKbbEmduuSR+WqZN+KdDlN2LwZbUKM8HG66edbia7pEkhExngeVwVl9dbASKITDgflHX2EMdjkgv/VJklMzWrUldVIl2x4c4iII9r9uunhdyqJQJ6yEBzPrguKiVLf9Tjuy/cChnp1fqpcSaIIoDKBnPTtgUQNUj9xtosuHHcvhSB9ntT5Ls1dFXK4YT4xEy+qNzt7a03laYkj3k0c0YUNXOXPKQ3CmR/tSS1tKYwzF9V9epRqeYFdSMEYKHDnk0j5yJWNMyrWc++SZsezDyAr+vtvYIkeTJEQ5bC97lyBnCr+uFfUi7KWT310=

On Tue, 2023-09-26 at 15:46 +0900, Masahiro Yamada wrote:
> On Tue, Sep 26, 2023 at 5:59=E2=80=AFAM Jack Brennen <jbrennen@google.com=
> wrote:
>=20
> > +Elf_Sym *symsearch_find_nearest(struct elf_info *elf, Elf_Addr addr,
> > +                               unsigned int secndx, bool allow_negativ=
e,
> > +                               Elf_Addr min_distance)
> > +{
> > +       size_t hi =3D elf->symsearch->table_size;
> > +       size_t lo =3D 0;
> > +       struct syminfo *table =3D elf->symsearch->table;
> > +       struct syminfo target;
> > +
> > +       target.addr =3D addr;
> > +       target.section_index =3D secndx;
> > +       target.symbol_index =3D ~0;  /* compares greater than any actua=
l index */
> > +       while (hi > lo) {
> > +               size_t mid =3D lo + (hi-lo)/2;   /* Avoids potential ov=
erflow */
> > +
> > +               if (syminfo_compare(&table[mid], &target) > 0)
> > +                       hi =3D mid;
> > +               else
> > +                       lo =3D mid+1;
>=20
> My preference is "low =3D mid + 1" over "low =3D mid+1"
>=20
> Documentation/process/coding-style.rst suggests spaces
> around binary operators.
>=20
> "
> Use one space around (on each side of) most binary and ternary operators,
> such as any of these::
>=20
>         =3D  +  -  <  >  *  /  %  |  &  ^  <=3D  >=3D  =3D=3D  !=3D  ?  :
> "
>=20
> I can see the corresponding line in the checkpatch tool:
>=20
> https://github.com/torvalds/linux/blob/v6.5/scripts/checkpatch.pl#L5330
>=20
>=20
> I wonder why the checkpatch did not detect it.
>=20
> Maybe, Joe Perches may know the reason.

checkpatch requires --strict to emit that message.

