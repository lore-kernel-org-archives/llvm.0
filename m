Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B8733EAEC;
	Fri, 29 Aug 2025 17:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756490365; cv=none; b=u7G5ijuqYuLUYM9Ti8u9r1t/dS3kZF2OtPZ0EeQZu5oDR3Qrwo2pOVjSI6yZ5NJJ/ShNQLF+FeLjtZtI++uM80Cv2wyR4i6dZwU7w/G4XPDA2+2OBJijQNs5TgKp+UksQ2mrrBTSEgbH2pguJlYAL8v4O7wgJ5PFVzTyB66JvkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756490365; c=relaxed/simple;
	bh=mOdcB8GbdMKp2t/NG+w5fECIeIvwGWTJ1ytEpQ5MXsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XiQa5YIgk6pcEFgamH0pkZSQnOZpajzWO8+zvJU4y3gQFM6rZ4XAvI5SWuKMor7LKg2M++uQ+1fE5CmvZAFZOuT5K3gsuq6XiyKofYNi3QXQAWPwmWjkwllYS3d1KwN/Rz2fOXzSnQYF2EfaMwjLEkzDxnnFoEH1BOY+Pe9bPvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UmhsmdgZ; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UmhsmdgZ"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4b30f73ca2cso9069251cf.0;
        Fri, 29 Aug 2025 10:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756490362; x=1757095162; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uzdpvd9RhN3thFvxfLj8J0a3RKDZVl45M7XvZcko3Rc=;
        b=UmhsmdgZgYUYDYFg4+s5yjqgK38OxbbeY+wVFqwVR7qMTREXYvyU7sIxXDMur53WAt
         G9H7+MShpBNCU/4JfyMeUyFjIoDbCy3FAksBNZLHfXCCQKpQlmnd0xkhL7IFiKYm+b4y
         edKz97th1jhw2GUh3UrduXmXVXl7kNTjES/RmWZEfx/DqTffA2xNkNQJF0JrAR7K1Kzw
         JGZxQ+otkyCds79KzMy9YJqnFGQSPJHuKlWYZvFHNzHzP/+mW/7gZZX5ksWXZaIXsZ90
         rDzKO4bXm+jc0rPo/RECyIbdb58yx2NGOezAP+qN+mjJcF8Yf8N4Jw73KQo6ykhiUAOC
         DPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756490362; x=1757095162;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uzdpvd9RhN3thFvxfLj8J0a3RKDZVl45M7XvZcko3Rc=;
        b=CzzY6Iv/grRCUUQZhpY58j4vUHnKjkH7oAOYNxCFyTvpKjzjdL7iS8fFhHugueF6WX
         yVrv474CaoJUshKgjWkAhmnBxMcKaub1bpMfYXU148hekpZgKZsinywmI9VBKFFNSZBz
         mQz72BnWaoxZqws+mlkCzIyAtntK6GTvZ9qLlTUleciMVR6FROpKkOdxdfopJT5GjQXJ
         3e2KnwCbX/Vi2m660VKHrfHiFbYxY50+ZBBUPlGcjC1xQ33IQZ4f0DBXfy5meyo3njUz
         WGGxorS073zEoXPw0Jk9Kxkr/VQqndwC0Enn0O967GrUcKtCG1c6kBcT5JAfF7NJhieR
         KSWA==
X-Forwarded-Encrypted: i=1; AJvYcCXcQsz6K78CZRvRU2/5vr4FO0jt6Lv+X+jFUzJMu66nYhAC1+8Ec5oPF5x1UJGzQavNEFEVkDs3cY6n6mUj@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3LwUUz2KheayMcWl3crchFnwLuScr5OdmbkagJ9Xb6VNnP6BT
	lcunSm1WwZC9YfN+cWPMCxQV9zVWaL7PGiRCIx9Ur01JzpnBfgCF4osIwVIa4agQVVVJrWCcgXm
	nsaFb7dFKDy/DJq3ipXDVLY2AMQz/qfg=
X-Gm-Gg: ASbGncvrVwTMdFltnh6xyjWGs1ZSdxqGjO3jenJpPPEdOnGeVFA3bSxfTPrwQA59mee
	5T9UsbxaUYVUoxxA3gpZA9d7cVtZimghIkptuMJEpYZ6asAmB/LYUD9p/96frcH7Hqm4wO0XPyM
	ae2iZn89lKQq/wqdJpEZPY9Sc+dMolvj+yaLLOA7j5LA+0rlqR983KW2hBBz5qGoF2wh5oOK7Z/
	k/8UCHSHjTv7oHioz2tH+/7eUgDB0NUiK1qST9TRNM5JQzNHUXC8osFw46TTu4Hy2NNXp0kDS7H
	n9UFSsXvVJOkuDdfolE5Wr8AhBks490P
X-Google-Smtp-Source: AGHT+IHupljaA2Q6/3ptYRdDpiCwRMF2EccEDQec2Udsz7gkl1/EBD55KOjKvYqtezdT5Uz1t1vpvMWfGuF/vU/58VU=
X-Received: by 2002:a05:6214:4019:b0:70d:fcf7:8a17 with SMTP id
 6a1803df08f44-70dfcf78bd4mr60957996d6.51.1756490362217; Fri, 29 Aug 2025
 10:59:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202508291432.M5gWPqJX-lkp@intel.com> <c18ba6b4-847e-4470-bd0e-9e5232add730@samba.org>
In-Reply-To: <c18ba6b4-847e-4470-bd0e-9e5232add730@samba.org>
From: Steve French <smfrench@gmail.com>
Date: Fri, 29 Aug 2025 12:59:09 -0500
X-Gm-Features: Ac12FXzR6gFq22ImE-6fqvCCp5xnqd-ooH1SHmDHEHs_fLGA6dx45i5GlohPc6E
Message-ID: <CAH2r5mvksbiH-D4FbVb0PVg1vnik+WU7d0kxRUk0S9h9S+=zvw@mail.gmail.com>
Subject: Re: [cifs:for-next-next 28/146] fs/smb/client/smbdirect.c:1856:25:
 warning: stack frame size (1272) exceeds limit (1024) in 'smbd_get_connection'
To: Stefan Metzmacher <metze@samba.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
	Steve French <stfrench@microsoft.com>, kernel test robot <lkp@intel.com>
Content-Type: multipart/mixed; boundary="00000000000017a9d7063d84c869"

--00000000000017a9d7063d84c869
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have updated the patch (see attached), and updated cifs-2.6.git for-next-=
next

>I'm not sure if the following should be added
> Reported-by: kernel test robot <lkp@intel.com>

That is a good question, but I lean against it since the "initial bug"
was not reported by them that caused the patch.  If it was a distinct
patch fixing the bug they pointed out, then yes it should be added,
but could be confusing if what they pointed out was totally unrelated
to the purpose of the patch.

On Fri, Aug 29, 2025 at 6:41=E2=80=AFAM Stefan Metzmacher <metze@samba.org>=
 wrote:
>
> Hi Steve,
>
> this is strange, but the following should fix the problem:
>
> --- a/fs/smb/common/smbdirect/smbdirect_socket.h
> +++ b/fs/smb/common/smbdirect/smbdirect_socket.h
> @@ -259,9 +259,11 @@ struct smbdirect_socket {
>
>   static __always_inline void smbdirect_socket_init(struct smbdirect_sock=
et *sc)
>   {
> -       *sc =3D (struct smbdirect_socket) {
> -               .status =3D SMBDIRECT_SOCKET_CREATED,
> -       };
> +       /*
> +        * This also sets status =3D SMBDIRECT_SOCKET_CREATED
> +        */
> +       BUILD_BUG_ON(SMBDIRECT_SOCKET_CREATED !=3D 0);
> +       memset(sc, 0, sizeof(*sc));
>
>          init_waitqueue_head(&sc->status_wait);
>
>
> It needs to be squashed into this commit:
> f2e2769275f4aa6e4d5fa98004301e91282a094a smb: smbdirect: introduce smbdir=
ect_socket_init()
>
> Can you do that?
>
> I'm not sure if the following should be added
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508291432.M5gWPqJX-lkp@i=
ntel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202508291615.Mxyg9D9N-lkp@i=
ntel.com/
>
> Thanks!
> metze
>
> Am 29.08.25 um 09:06 schrieb kernel test robot:
> > tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next-next
> > head:   b79712ce1752aa38da9553b06767f68367b0d7ff
> > commit: 36d70a0c8405556dea3d4e9beef708d7ed3c2b07 [28/146] smb: client: =
make use of smbdirect_socket_init()
> > config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/2=
0250829/202508291432.M5gWPqJX-lkp@intel.com/config)
> > compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 60=
09708b4367171ccdbf4b5905cb6a803753fe18)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20250829/202508291432.M5gWPqJX-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202508291432.M5gWPqJX-l=
kp@intel.com/
>
>
> > All warnings (new ones prefixed by >>):
> >
> >>> fs/smb/client/smbdirect.c:1856:25: warning: stack frame size (1272) e=
xceeds limit (1024) in 'smbd_get_connection' [-Wframe-larger-than]
> >      1856 | struct smbd_connection *smbd_get_connection(
> >           |                         ^
> >     1 warning generated.
>
> >
> > vim +/smbd_get_connection +1856 fs/smb/client/smbdirect.c
> >
> > 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1855
> > 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17 @1856  struct sm=
bd_connection *smbd_get_connection(
> > 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1857          s=
truct TCP_Server_Info *server, struct sockaddr *dstaddr)
> > 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1858  {
> > 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1859          s=
truct smbd_connection *ret;
> > 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1860          i=
nt port =3D SMBD_PORT;
> > 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1861
> > 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1862  try_again=
:
> > 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1863          r=
et =3D _smbd_get_connection(server, dstaddr, port);
> > 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1864
> > 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1865          /=
* Try SMB_PORT if SMBD_PORT doesn't work */
> > 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1866          i=
f (!ret && port =3D=3D SMBD_PORT) {
> > 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1867           =
       port =3D SMB_PORT;
> > 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1868           =
       goto try_again;
> > 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1869          }
> > 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1870          r=
eturn ret;
> > 399f9539d951adf fs/cifs/smbdirect.c Long Li 2017-11-17  1871  }
> > f64b78fd1835d1d fs/cifs/smbdirect.c Long Li 2017-11-22  1872
> >
> > :::::: The code at line 1856 was first introduced by commit
> > :::::: 399f9539d951adf26a1078e38c1b0f10cf6c3e71 CIFS: SMBD: Implement f=
unction to create a SMB Direct connection
> >
> > :::::: TO: Long Li <longli@microsoft.com>
> > :::::: CC: Steve French <smfrench@gmail.com>
> >
>


--=20
Thanks,

Steve

--00000000000017a9d7063d84c869
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-smb-client-make-use-of-smbdirect_socket_init.patch"
Content-Disposition: attachment; 
	filename="0001-smb-client-make-use-of-smbdirect_socket_init.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mex4wcy70>
X-Attachment-Id: f_mex4wcy70

RnJvbSA0MTVlZTAzZGZmNDgxNjQ2MTFiNjg0MDM2YjQwNWI1MTMzMzdkZTc5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGVmYW4gTWV0em1hY2hlciA8bWV0emVAc2FtYmEub3JnPgpE
YXRlOiBGcmksIDggQXVnIDIwMjUgMTU6MTA6NTIgKzAyMDAKU3ViamVjdDogW1BBVENIXSBzbWI6
IGNsaWVudDogbWFrZSB1c2Ugb2Ygc21iZGlyZWN0X3NvY2tldF9pbml0KCkKCkl0J3MgbXVjaCBz
YWZlciB0byBpbml0aWFsaXplIHRoZSB3aG9sZSBzdHJ1Y3R1cmUgYXQKdGhlIGJlZ2lubmluZyB0
aGFuIGRvaW5nIGl0IGFsbCBvdmVyIHRoZSBwbGFjZQphbmQgdGhlbiBtaXNzIHRvIG1vdmUgaXQg
aWYgY29kZSBjaGFuZ2VzLgoKQ2M6IFN0ZXZlIEZyZW5jaCA8c21mcmVuY2hAZ21haWwuY29tPgpD
YzogVG9tIFRhbHBleSA8dG9tQHRhbHBleS5jb20+CkNjOiBMb25nIExpIDxsb25nbGlAbWljcm9z
b2Z0LmNvbT4KQ2M6IGxpbnV4LWNpZnNAdmdlci5rZXJuZWwub3JnCkNjOiBzYW1iYS10ZWNobmlj
YWxAbGlzdHMuc2FtYmEub3JnClNpZ25lZC1vZmYtYnk6IFN0ZWZhbiBNZXR6bWFjaGVyIDxtZXR6
ZUBzYW1iYS5vcmc+ClNpZ25lZC1vZmYtYnk6IFN0ZXZlIEZyZW5jaCA8c3RmcmVuY2hAbWljcm9z
b2Z0LmNvbT4KLS0tCiBmcy9zbWIvY2xpZW50L3NtYmRpcmVjdC5jICAgICAgICAgICAgICAgICAg
fCAxMyArLS0tLS0tLS0tLS0tCiBmcy9zbWIvY29tbW9uL3NtYmRpcmVjdC9zbWJkaXJlY3Rfc29j
a2V0LmggfCAgOCArKysrKy0tLQogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDE1
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL3NtYi9jbGllbnQvc21iZGlyZWN0LmMgYi9m
cy9zbWIvY2xpZW50L3NtYmRpcmVjdC5jCmluZGV4IGI2N2EyNjRhNjAzMC4uZGVkOTEyZTkwNGYw
IDEwMDY0NAotLS0gYS9mcy9zbWIvY2xpZW50L3NtYmRpcmVjdC5jCisrKyBiL2ZzL3NtYi9jbGll
bnQvc21iZGlyZWN0LmMKQEAgLTEzNTEsMTMgKzEzNTEsNiBAQCBzdGF0aWMgaW50IGFsbG9jYXRl
X3JlY2VpdmVfYnVmZmVycyhzdHJ1Y3Qgc21iZF9jb25uZWN0aW9uICppbmZvLCBpbnQgbnVtX2J1
ZikKIAlzdHJ1Y3Qgc21iZGlyZWN0X3JlY3ZfaW8gKnJlc3BvbnNlOwogCWludCBpOwogCi0JSU5J
VF9MSVNUX0hFQUQoJnNjLT5yZWN2X2lvLnJlYXNzZW1ibHkubGlzdCk7Ci0Jc3Bpbl9sb2NrX2lu
aXQoJnNjLT5yZWN2X2lvLnJlYXNzZW1ibHkubG9jayk7Ci0Jc2MtPnJlY3ZfaW8ucmVhc3NlbWJs
eS5kYXRhX2xlbmd0aCA9IDA7Ci0Jc2MtPnJlY3ZfaW8ucmVhc3NlbWJseS5xdWV1ZV9sZW5ndGgg
PSAwOwotCi0JSU5JVF9MSVNUX0hFQUQoJnNjLT5yZWN2X2lvLmZyZWUubGlzdCk7Ci0Jc3Bpbl9s
b2NrX2luaXQoJnNjLT5yZWN2X2lvLmZyZWUubG9jayk7CiAJaW5mby0+Y291bnRfcmVjZWl2ZV9x
dWV1ZSA9IDA7CiAKIAlpbml0X3dhaXRxdWV1ZV9oZWFkKCZpbmZvLT53YWl0X3JlY2VpdmVfcXVl
dWVzKTsKQEAgLTE2NTYsMTQgKzE2NDksMTIgQEAgc3RhdGljIHN0cnVjdCBzbWJkX2Nvbm5lY3Rp
b24gKl9zbWJkX2dldF9jb25uZWN0aW9uKAogCWlmICghaW5mbykKIAkJcmV0dXJuIE5VTEw7CiAJ
c2MgPSAmaW5mby0+c29ja2V0OworCXNtYmRpcmVjdF9zb2NrZXRfaW5pdChzYyk7CiAJc3AgPSAm
c2MtPnBhcmFtZXRlcnM7CiAKIAlpbmZvLT5pbml0aWF0b3JfZGVwdGggPSAxOwogCWluZm8tPnJl
c3BvbmRlcl9yZXNvdXJjZXMgPSBTTUJEX0NNX1JFU1BPTkRFUl9SRVNPVVJDRVM7CiAKLQlpbml0
X3dhaXRxdWV1ZV9oZWFkKCZzYy0+c3RhdHVzX3dhaXQpOwotCi0Jc2MtPnN0YXR1cyA9IFNNQkRJ
UkVDVF9TT0NLRVRfQ1JFQVRFRDsKIAlyYyA9IHNtYmRfaWFfb3BlbihpbmZvLCBkc3RhZGRyLCBw
b3J0KTsKIAlpZiAocmMpIHsKIAkJbG9nX3JkbWFfZXZlbnQoSU5GTywgInNtYmRfaWFfb3BlbiBy
Yz0lZFxuIiwgcmMpOwpAQCAtMTc3Myw4ICsxNzY0LDYgQEAgc3RhdGljIHN0cnVjdCBzbWJkX2Nv
bm5lY3Rpb24gKl9zbWJkX2dldF9jb25uZWN0aW9uKAogCWxvZ19yZG1hX2V2ZW50KElORk8sICJj
b25uZWN0aW5nIHRvIElQICVwSTQgcG9ydCAlZFxuIiwKIAkJJmFkZHJfaW4tPnNpbl9hZGRyLCBw
b3J0KTsKIAotCWluaXRfd2FpdHF1ZXVlX2hlYWQoJnNjLT5yZWN2X2lvLnJlYXNzZW1ibHkud2Fp
dF9xdWV1ZSk7Ci0KIAlXQVJOX09OX09OQ0Uoc2MtPnN0YXR1cyAhPSBTTUJESVJFQ1RfU09DS0VU
X1JETUFfQ09OTkVDVF9ORUVERUQpOwogCXNjLT5zdGF0dXMgPSBTTUJESVJFQ1RfU09DS0VUX1JE
TUFfQ09OTkVDVF9SVU5OSU5HOwogCXJjID0gcmRtYV9jb25uZWN0KHNjLT5yZG1hLmNtX2lkLCAm
Y29ubl9wYXJhbSk7CmRpZmYgLS1naXQgYS9mcy9zbWIvY29tbW9uL3NtYmRpcmVjdC9zbWJkaXJl
Y3Rfc29ja2V0LmggYi9mcy9zbWIvY29tbW9uL3NtYmRpcmVjdC9zbWJkaXJlY3Rfc29ja2V0LmgK
aW5kZXggNjRhYmU2OTMyZmVmLi5jNjJkMTJmNjNlMTMgMTAwNjQ0Ci0tLSBhL2ZzL3NtYi9jb21t
b24vc21iZGlyZWN0L3NtYmRpcmVjdF9zb2NrZXQuaAorKysgYi9mcy9zbWIvY29tbW9uL3NtYmRp
cmVjdC9zbWJkaXJlY3Rfc29ja2V0LmgKQEAgLTI1OSw5ICsyNTksMTEgQEAgc3RydWN0IHNtYmRp
cmVjdF9zb2NrZXQgewogCiBzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgc21iZGlyZWN0X3Nv
Y2tldF9pbml0KHN0cnVjdCBzbWJkaXJlY3Rfc29ja2V0ICpzYykKIHsKLQkqc2MgPSAoc3RydWN0
IHNtYmRpcmVjdF9zb2NrZXQpIHsKLQkJLnN0YXR1cyA9IFNNQkRJUkVDVF9TT0NLRVRfQ1JFQVRF
RCwKLQl9OworCS8qCisJICogVGhpcyBhbHNvIHNldHMgc3RhdHVzID0gU01CRElSRUNUX1NPQ0tF
VF9DUkVBVEVECisJICovCisJQlVJTERfQlVHX09OKFNNQkRJUkVDVF9TT0NLRVRfQ1JFQVRFRCAh
PSAwKTsKKwltZW1zZXQoc2MsIDAsIHNpemVvZigqc2MpKTsKIAogCWluaXRfd2FpdHF1ZXVlX2hl
YWQoJnNjLT5zdGF0dXNfd2FpdCk7CiAKLS0gCjIuNDguMQoK
--00000000000017a9d7063d84c869--
