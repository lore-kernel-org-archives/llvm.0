Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86472194C9D
	for <llvm@lists.linux.dev>; Fri,  9 Aug 2024 15:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723218428; cv=none; b=TLFFwgb+wuHTkNY4xA19pzFLxlUNxe644V0XY4bnjbW21BzgbO8wxqVyH8KwUNlAk6DvayTzwZ06T8HBwiquEOSVa61Dz6tRrZTAgfx2iDevmmRGIxMCi05jM4ZprY9YYMB3Pe7+MI6LCrMe3tYpJdqGuRjAnFlsNdwl/XwKRfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723218428; c=relaxed/simple;
	bh=sQnmR5SxRB6Lk+I2X9cbMRPic8+VnUFnqhy9Mb5dAKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oE/Z+Ml+bJixLDzZoXOE64Pr4rMuM/XLp4LY/X2Fm/03UFx+ukNd1if2rqM00xAUlL+Tg/VbCxaFLGfUi4ZXdGqraMy7PMUcIUOfKogbs576Ye+mJNYHGhqpiqI7qZePVKV7ocUYDLGJk5Xq3FSw2Zr4HH4aWHnGaNp2LYIepk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FSmtPzv1; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FSmtPzv1"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ef32fea28dso23418461fa.2
        for <llvm@lists.linux.dev>; Fri, 09 Aug 2024 08:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723218424; x=1723823224; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NWYsmV8/lUnyC4yFYPD2C6vKhh+g+kN7n8dvQWyHoKo=;
        b=FSmtPzv1cN6bIoUWobQ5hC1+9aElVVpDZ1VD0nZC+Q1lT0rgUSCNZ7Axx4lhRoTvQf
         3KIp6ymeRUMQFasiCqOamZ4EMEIUnMI7CjvWJP6FIg3RhAL76Z6OE2LhDH0PQBSX2+k2
         ylQA7EpNrj+wlEIMSP5LsgaCl9+jv3+BOM/qX4xzeXCdVWV3e5SEZnA353ur5x+0l2gd
         hZelIrA2oAJx0IdUZ/fyZj+EvgsCtRGYphVeuiFYmdyY2mPZJ79hcjFyzv26DBs3/0i8
         8iWZwU5PkHVmv1EB4B09Awgr0iQGfW5JKm152nUd4RuVuhqo9TXV/JAjQB3UCgxBXKAI
         MVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723218424; x=1723823224;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NWYsmV8/lUnyC4yFYPD2C6vKhh+g+kN7n8dvQWyHoKo=;
        b=CLB9ETLGU6ETjnHGklQh1z2SqJv8gCaNDVrCeS5EPchzerK9VuZLNo6nL2FkFexyAD
         FS3pAUfqPOZMeE7r0qzi9k87Pj0Jw+xyAhxz+aD+wgEWRnqEW+roAnkvXJVEM4X7myZA
         jISToOkzPRAn43BVfTmUt2Z3bjbW2gnxabe0D/nlP3udJbXj52AkE3ptUg3p0piRPoaI
         13OdXbKrX+5hKYI2vn5BvcYZ6e9vA9MxZ9nnX69BMhHNNtbbzJt+KMTFf24075IQqtQu
         EOPSMxrGKjVggxuYYyhSI/vSNTbERc+MeBFGP3opmmSm43ZbBQBIXNEHW06Wvsh5ZA15
         TQUA==
X-Forwarded-Encrypted: i=1; AJvYcCWhrXkncIOC+3v4sBix20iy+1v+TTxzOwydlVRK+pBl1SElWlkUG4ZZBZDGvGZlpjCSPwQmHz1yxxa/GHG5YMV905CGFw==
X-Gm-Message-State: AOJu0YzY50GMlOuZ4dbAz/vUsMiCTrDqyGI4UxCjlknMTil8YK14bL91
	WIQuKKVeqwkV4SLkCLZKOAmg1hV7h50TneRLcEUhf353DO/HV3MDy2yW5pQJjKvPQt3TPfc9y3F
	Tr/heLZSXQZdy4NvCW42jj4ljfzA=
X-Google-Smtp-Source: AGHT+IH6yg1l8e+9EMuLYJcwcxTnDSaQ04Pd16fOj7UNBoTdgJ0dazsX16YcIOqGr59IOdst9bLTdGwjdcNGQymaQWg=
X-Received: by 2002:a05:6512:39cd:b0:52c:cc38:592c with SMTP id
 2adb3069b0e04-530ee8b8773mr1614616e87.0.1723218423602; Fri, 09 Aug 2024
 08:47:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240808122331.342473-1-suhui@nfschina.com> <893f2ebb-2979-4e34-bdab-a7cbb0c7e7b8@stanley.mountain>
 <a08c6b03-6d23-4711-a891-14b0250b90be@stanley.mountain> <CAH2r5msS8_Jc0hRXqY==OGiaoJKyjqkh7HT0esSKcEvsxht46Q@mail.gmail.com>
In-Reply-To: <CAH2r5msS8_Jc0hRXqY==OGiaoJKyjqkh7HT0esSKcEvsxht46Q@mail.gmail.com>
From: Steve French <smfrench@gmail.com>
Date: Fri, 9 Aug 2024 10:46:52 -0500
Message-ID: <CAH2r5mu2FkMGNKrbU+Kt3BeutzM4AyKZFjbWXg+zioPzQofDSw@mail.gmail.com>
Subject: Re: [PATCH] smb/client: avoid possible NULL dereference in cifs_free_subrequest()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Su Hui <suhui@nfschina.com>, David Howells <dhowells@redhat.com>, sfrench@samba.org, 
	pc@manguebit.com, ronniesahlberg@gmail.com, sprasad@microsoft.com, 
	tom@talpey.com, bharathsm@microsoft.com, nathan@kernel.org, 
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com, 
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kernel-janitors@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000002e99c061f420e99"

--00000000000002e99c061f420e99
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Updated patch to change Fixes tag and Cc: David


On Fri, Aug 9, 2024 at 10:42=E2=80=AFAM Steve French <smfrench@gmail.com> w=
rote:
>
> On Fri, Aug 9, 2024 at 10:11=E2=80=AFAM Dan Carpenter <dan.carpenter@lina=
ro.org> wrote:
> >
> > On Fri, Aug 09, 2024 at 06:00:26PM +0300, Dan Carpenter wrote:
> > > On Thu, Aug 08, 2024 at 08:23:32PM +0800, Su Hui wrote:
> > > > Clang static checker (scan-build) warning:
> > > >     cifsglob.h:line 890, column 3
> > > >     Access to field 'ops' results in a dereference of a null pointe=
r.
> > > >
> > > > Commit 519be989717c ("cifs: Add a tracepoint to track credits invol=
ved in
> > > > R/W requests") adds a check for 'rdata->server', and let clang thro=
w this
> > > > warning about NULL dereference.
> > > >
> > > > When 'rdata->credits.value !=3D 0 && rdata->server =3D=3D NULL' hap=
pens,
> > > > add_credits_and_wake_if() will call rdata->server->ops->add_credits=
().
> > > > This will cause NULL dereference problem. Add a check for 'rdata->s=
erver'
> > > > to avoid NULL dereference.
> > > >
> > > > Signed-off-by: Su Hui <suhui@nfschina.com>
> > >
> > > Needs a Fixes tag.
> > >
> > > Also when you add a Fixes tag, then get_maintainer will add the David=
 Howells
> > > automatically.  I've added him manually.
> > >
> >
> > Actually, David should have been CC'd but the fixes tag wouldn't have p=
ointed
> > to his patch.
> >
> > This is an inconsistent NULL checking warning.  It's not clear to me if=
 the NULL
> > checks should be removed or more added.  If David were trying to fix a =
NULL
> > pointer dereference and accidentally left one unchecked dereference out=
 then the
> > Fixes tag would point to his patch.  Since David was doing something un=
related
>
> Looks like (if this is even possible for server to to be null) then I
> will need to change
> the fixes to commit 69c3c023af25. I will update the tag in the current
> patch in for-next
>
> Author: David Howells <dhowells@redhat.com>
> Date:   Fri Oct 6 18:16:15 2023 +0100
>
>     cifs: Implement netfslib hooks
>
>     Provide implementation of the netfslib hooks that will be used by net=
fslib
>     to ask cifs to set up and perform operations.
> --
> Thanks,
>
> Steve



--=20
Thanks,

Steve

--00000000000002e99c061f420e99
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb-client-avoid-possible-NULL-dereference-in-cifs_f.patch"
Content-Disposition: attachment; 
	filename="0001-smb-client-avoid-possible-NULL-dereference-in-cifs_f.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lzmvqytv0>
X-Attachment-Id: f_lzmvqytv0

RnJvbSA1OWFjMWFhYzE1NTA3MzFjYTI0MTAwN2FmNjYwZmM1Mjc4Yzg4MTM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdSBIdWkgPHN1aHVpQG5mc2NoaW5hLmNvbT4KRGF0ZTogVGh1
LCA4IEF1ZyAyMDI0IDIwOjIzOjMyICswODAwClN1YmplY3Q6IFtQQVRDSF0gc21iL2NsaWVudDog
YXZvaWQgcG9zc2libGUgTlVMTCBkZXJlZmVyZW5jZSBpbgogY2lmc19mcmVlX3N1YnJlcXVlc3Qo
KQoKQ2xhbmcgc3RhdGljIGNoZWNrZXIgKHNjYW4tYnVpbGQpIHdhcm5pbmc6CgljaWZzZ2xvYi5o
OmxpbmUgODkwLCBjb2x1bW4gMwoJQWNjZXNzIHRvIGZpZWxkICdvcHMnIHJlc3VsdHMgaW4gYSBk
ZXJlZmVyZW5jZSBvZiBhIG51bGwgcG9pbnRlci4KCkNvbW1pdCA1MTliZTk4OTcxN2MgKCJjaWZz
OiBBZGQgYSB0cmFjZXBvaW50IHRvIHRyYWNrIGNyZWRpdHMgaW52b2x2ZWQgaW4KUi9XIHJlcXVl
c3RzIikgYWRkcyBhIGNoZWNrIGZvciAncmRhdGEtPnNlcnZlcicsIGFuZCBsZXQgY2xhbmcgdGhy
b3cgdGhpcwp3YXJuaW5nIGFib3V0IE5VTEwgZGVyZWZlcmVuY2UuCgpXaGVuICdyZGF0YS0+Y3Jl
ZGl0cy52YWx1ZSAhPSAwICYmIHJkYXRhLT5zZXJ2ZXIgPT0gTlVMTCcgaGFwcGVucywKYWRkX2Ny
ZWRpdHNfYW5kX3dha2VfaWYoKSB3aWxsIGNhbGwgcmRhdGEtPnNlcnZlci0+b3BzLT5hZGRfY3Jl
ZGl0cygpLgpUaGlzIHdpbGwgY2F1c2UgTlVMTCBkZXJlZmVyZW5jZSBwcm9ibGVtLiBBZGQgYSBj
aGVjayBmb3IgJ3JkYXRhLT5zZXJ2ZXInCnRvIGF2b2lkIE5VTEwgZGVyZWZlcmVuY2UuCgpDYzog
c3RhYmxlQHZnZXIua2VybmVsLm9yZwpGaXhlczogNjljM2MwMjNhZjI1ICgiY2lmczogSW1wbGVt
ZW50IG5ldGZzbGliIGhvb2tzIikKQ2M6IERhdmlkIEhvd2VsbHMgPGRob3dlbGxzQHJlZGhhdC5j
b20+ClNpZ25lZC1vZmYtYnk6IFN1IEh1aSA8c3VodWlAbmZzY2hpbmEuY29tPgpTaWduZWQtb2Zm
LWJ5OiBTdGV2ZSBGcmVuY2ggPHN0ZnJlbmNoQG1pY3Jvc29mdC5jb20+Ci0tLQogZnMvc21iL2Ns
aWVudC9maWxlLmMgfCA4ICsrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL3NtYi9jbGllbnQvZmlsZS5jIGIvZnMv
c21iL2NsaWVudC9maWxlLmMKaW5kZXggYjI0MDVkZDRkNGQ0Li40NTQ1OWFmNTA0NGQgMTAwNjQ0
Ci0tLSBhL2ZzL3NtYi9jbGllbnQvZmlsZS5jCisrKyBiL2ZzL3NtYi9jbGllbnQvZmlsZS5jCkBA
IC0zMTUsNyArMzE1LDcgQEAgc3RhdGljIHZvaWQgY2lmc19mcmVlX3N1YnJlcXVlc3Qoc3RydWN0
IG5ldGZzX2lvX3N1YnJlcXVlc3QgKnN1YnJlcSkKICNlbmRpZgogCX0KIAotCWlmIChyZGF0YS0+
Y3JlZGl0cy52YWx1ZSAhPSAwKQorCWlmIChyZGF0YS0+Y3JlZGl0cy52YWx1ZSAhPSAwKSB7CiAJ
CXRyYWNlX3NtYjNfcndfY3JlZGl0cyhyZGF0YS0+cnJlcS0+ZGVidWdfaWQsCiAJCQkJICAgICAg
cmRhdGEtPnN1YnJlcS5kZWJ1Z19pbmRleCwKIAkJCQkgICAgICByZGF0YS0+Y3JlZGl0cy52YWx1
ZSwKQEAgLTMyMyw4ICszMjMsMTIgQEAgc3RhdGljIHZvaWQgY2lmc19mcmVlX3N1YnJlcXVlc3Qo
c3RydWN0IG5ldGZzX2lvX3N1YnJlcXVlc3QgKnN1YnJlcSkKIAkJCQkgICAgICByZGF0YS0+c2Vy
dmVyID8gcmRhdGEtPnNlcnZlci0+aW5fZmxpZ2h0IDogMCwKIAkJCQkgICAgICAtcmRhdGEtPmNy
ZWRpdHMudmFsdWUsCiAJCQkJICAgICAgY2lmc190cmFjZV9yd19jcmVkaXRzX2ZyZWVfc3VicmVx
KTsKKwkJaWYgKHJkYXRhLT5zZXJ2ZXIpCisJCQlhZGRfY3JlZGl0c19hbmRfd2FrZV9pZihyZGF0
YS0+c2VydmVyLCAmcmRhdGEtPmNyZWRpdHMsIDApOworCQllbHNlCisJCQlyZGF0YS0+Y3JlZGl0
cy52YWx1ZSA9IDA7CisJfQogCi0JYWRkX2NyZWRpdHNfYW5kX3dha2VfaWYocmRhdGEtPnNlcnZl
ciwgJnJkYXRhLT5jcmVkaXRzLCAwKTsKIAlpZiAocmRhdGEtPmhhdmVfeGlkKQogCQlmcmVlX3hp
ZChyZGF0YS0+eGlkKTsKIH0KLS0gCjIuNDMuMAoK
--00000000000002e99c061f420e99--
