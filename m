Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23E810792
	for <llvm@lists.linux.dev>; Tue,  7 Mar 2023 21:06:50 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id i34so57749385eda.7
        for <llvm@lists.linux.dev>; Tue, 07 Mar 2023 13:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1678223209;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d3EmGp5fzDwlHCmDu7H4pzhEBDJeCZ+kE8lTuXvrdGw=;
        b=UpGFOXyfbpZwDH7Myr9yDuuJ/n0GuSSm1+E1YtuXJCFYQ0aspQdsPes3a72NvCEwJ7
         mtf9e6f6Vrl7BNDJCxe64+4oQ7BUSlbpUqB460v4TBtx7IkUEPbzNEn16vpujXJxT/By
         4hY0wHvSz0/a9v8iziS7eTwrWs7nVbowSRCdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678223209;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d3EmGp5fzDwlHCmDu7H4pzhEBDJeCZ+kE8lTuXvrdGw=;
        b=kEDVJsi4QB5M4r2jG1fDqvRY+7vQOh52Gwil+DGJ6PCfPYw8U7UpP9ptm29Hhojc85
         36mO64pnhMxWia6NOK569Dz6urDMNWhsjLVpnyhiLHtG6OlzQsYf0G2d6EftXrN8vrtY
         Y1y9ZIPlfA85rJjxImT7dUNI56ro67WNLP8xv475l+4+7eTm04VHYLAf0nxvMiZLnU8g
         HpMYk6vICKzbuUcXHeCmhpGwYP5vYahLJb9pFSBjK9wcbO+zrvrbv/F4yicaSRsOWZ3K
         J8Wv0Gp1mbudEmrEbf+k0NSBfyWcBodIPP7/e1dNEESP/PSrgdDKxlMavsnsqXoyRRqJ
         JTUQ==
X-Gm-Message-State: AO0yUKWtqXU6on7+imSCZi0rqrBeAtQ1Ec1OG3MpxclHsVeV/83joodn
	B9WNie70ZMGvlRbd382urSLg68SL2/wGrX+ieF6rm+dW
X-Google-Smtp-Source: AK7set8Zhj0Ij7D7y2p4ntUgPS4IUiZv6d45diYFzIFLkMdtzqDmtNjD94Tzogx6vdn3Is/1u8dxxA==
X-Received: by 2002:a17:907:6d87:b0:8f6:52c:afa0 with SMTP id sb7-20020a1709076d8700b008f6052cafa0mr18655228ejc.23.1678223208719;
        Tue, 07 Mar 2023 13:06:48 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id m27-20020a170906599b00b008dea022f5e6sm6543907ejs.24.2023.03.07.13.06.46
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 13:06:47 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id g3so57871806eda.1
        for <llvm@lists.linux.dev>; Tue, 07 Mar 2023 13:06:46 -0800 (PST)
X-Received: by 2002:a17:906:398a:b0:877:747e:f076 with SMTP id
 h10-20020a170906398a00b00877747ef076mr7345032eje.0.1678223206531; Tue, 07 Mar
 2023 13:06:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230303231133.1486085-1-eranian@google.com> <20230306120106.GE1267364@hirez.programming.kicks-ass.net>
 <CAKwvOdnRvd5KK01awAyeyt5S36TPPW4_8Z6YL1r4gB-pBrHTbg@mail.gmail.com>
 <20230307113545.GB2017917@hirez.programming.kicks-ass.net>
 <20230307184315.GS25951@gate.crashing.org> <ZAeh8g0nr3IFRSVI@tucnak> <CAHk-=whOLcy=oz=gHyoSSEnqc3M-APKFKTtTvA_3wYYPV8L+oA@mail.gmail.com>
In-Reply-To: <CAHk-=whOLcy=oz=gHyoSSEnqc3M-APKFKTtTvA_3wYYPV8L+oA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 7 Mar 2023 13:06:29 -0800
X-Gmail-Original-Message-ID: <CAHk-=whCA4-uc5WV_-68Mpmu-TiSv6fxkSjZ19zzcW9jpSxDvA@mail.gmail.com>
Message-ID: <CAHk-=whCA4-uc5WV_-68Mpmu-TiSv6fxkSjZ19zzcW9jpSxDvA@mail.gmail.com>
Subject: Re: [PATCH] x86/resctrl: avoid compiler optimization in __resctrl_sched_in
To: Jakub Jelinek <jakub@redhat.com>
Cc: Segher Boessenkool <segher@kernel.crashing.org>, Peter Zijlstra <peterz@infradead.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Stephane Eranian <eranian@google.com>, 
	linux-kernel@vger.kernel.org, tony.luck@intel.com, reinette.chatre@intel.com, 
	fenghua.yu@intel.com, peternewman@google.com, james.morse@arm.com, 
	babu.moger@amd.com, ananth.narayan@amd.com, vschneid@redhat.com, 
	Nathan Chancellor <nathan@kernel.org>, clang-built-linux <llvm@lists.linux.dev>, Borislav Petkov <bp@alien8.de>, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-toolchains@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000148e7005f655ca63"

--000000000000148e7005f655ca63
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 7, 2023 at 12:54=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I think the problem is that the <asm/resctrl.h> code is disgusting and
> horrible in multiple ways:
>
>  (a) it shouldn't define and declare a static function in a header file
>
>  (b) the resctrl_sched_in() inline function is misdesigned to begin with

Ok, so here's a *ttoally* untested and mindless patch to maybe fix
what I dislike about that resctl code.

Does it fix the code generation issue? I have no idea. But this is
what I would suggest is the right answer, without actually knowing the
code any better, and just going on a mindless rampage.

It seems to compile for me, fwiw.

             Linus

--000000000000148e7005f655ca63
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_leyqqvgo0>
X-Attachment-Id: f_leyqqvgo0

IGFyY2gveDg2L2luY2x1ZGUvYXNtL3Jlc2N0cmwuaCAgICAgICAgIHwgMTIgKysrKysrLS0tLS0t
CiBhcmNoL3g4Ni9rZXJuZWwvY3B1L3Jlc2N0cmwvcmR0Z3JvdXAuYyB8ICA0ICsrLS0KIGFyY2gv
eDg2L2tlcm5lbC9wcm9jZXNzXzMyLmMgICAgICAgICAgIHwgIDIgKy0KIGFyY2gveDg2L2tlcm5l
bC9wcm9jZXNzXzY0LmMgICAgICAgICAgIHwgIDIgKy0KIDQgZmlsZXMgY2hhbmdlZCwgMTAgaW5z
ZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVk
ZS9hc20vcmVzY3RybC5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vcmVzY3RybC5oCmluZGV4IDUy
Nzg4Zjc5Nzg2Zi4uMjU1YTc4ZDlkOTA2IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2Fz
bS9yZXNjdHJsLmgKKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vcmVzY3RybC5oCkBAIC00OSw3
ICs0OSw3IEBAIERFQ0xBUkVfU1RBVElDX0tFWV9GQUxTRShyZHRfbW9uX2VuYWJsZV9rZXkpOwog
ICogICBzaW1wbGUgYXMgcG9zc2libGUuCiAgKiBNdXN0IGJlIGNhbGxlZCB3aXRoIHByZWVtcHRp
b24gZGlzYWJsZWQuCiAgKi8KLXN0YXRpYyB2b2lkIF9fcmVzY3RybF9zY2hlZF9pbih2b2lkKQor
c3RhdGljIGlubGluZSB2b2lkIF9fcmVzY3RybF9zY2hlZF9pbihzdHJ1Y3QgdGFza19zdHJ1Y3Qg
KnRzaykKIHsKIAlzdHJ1Y3QgcmVzY3RybF9wcXJfc3RhdGUgKnN0YXRlID0gdGhpc19jcHVfcHRy
KCZwcXJfc3RhdGUpOwogCXUzMiBjbG9zaWQgPSBzdGF0ZS0+ZGVmYXVsdF9jbG9zaWQ7CkBAIC02
MSwxMyArNjEsMTMgQEAgc3RhdGljIHZvaWQgX19yZXNjdHJsX3NjaGVkX2luKHZvaWQpCiAJICog
RWxzZSB1c2UgdGhlIGNsb3NpZC9ybWlkIGFzc2lnbmVkIHRvIHRoaXMgY3B1LgogCSAqLwogCWlm
IChzdGF0aWNfYnJhbmNoX2xpa2VseSgmcmR0X2FsbG9jX2VuYWJsZV9rZXkpKSB7Ci0JCXRtcCA9
IFJFQURfT05DRShjdXJyZW50LT5jbG9zaWQpOworCQl0bXAgPSBSRUFEX09OQ0UodHNrLT5jbG9z
aWQpOwogCQlpZiAodG1wKQogCQkJY2xvc2lkID0gdG1wOwogCX0KIAogCWlmIChzdGF0aWNfYnJh
bmNoX2xpa2VseSgmcmR0X21vbl9lbmFibGVfa2V5KSkgewotCQl0bXAgPSBSRUFEX09OQ0UoY3Vy
cmVudC0+cm1pZCk7CisJCXRtcCA9IFJFQURfT05DRSh0c2stPnJtaWQpOwogCQlpZiAodG1wKQog
CQkJcm1pZCA9IHRtcDsKIAl9CkBAIC04OCwxNyArODgsMTcgQEAgc3RhdGljIGlubGluZSB1bnNp
Z25lZCBpbnQgcmVzY3RybF9hcmNoX3JvdW5kX21vbl92YWwodW5zaWduZWQgaW50IHZhbCkKIAly
ZXR1cm4gdmFsICogc2NhbGU7CiB9CiAKLXN0YXRpYyBpbmxpbmUgdm9pZCByZXNjdHJsX3NjaGVk
X2luKHZvaWQpCitzdGF0aWMgaW5saW5lIHZvaWQgcmVzY3RybF9zY2hlZF9pbihzdHJ1Y3QgdGFz
a19zdHJ1Y3QgKnRzaykKIHsKIAlpZiAoc3RhdGljX2JyYW5jaF9saWtlbHkoJnJkdF9lbmFibGVf
a2V5KSkKLQkJX19yZXNjdHJsX3NjaGVkX2luKCk7CisJCV9fcmVzY3RybF9zY2hlZF9pbih0c2sp
OwogfQogCiB2b2lkIHJlc2N0cmxfY3B1X2RldGVjdChzdHJ1Y3QgY3B1aW5mb194ODYgKmMpOwog
CiAjZWxzZQogCi1zdGF0aWMgaW5saW5lIHZvaWQgcmVzY3RybF9zY2hlZF9pbih2b2lkKSB7fQor
c3RhdGljIGlubGluZSB2b2lkIHJlc2N0cmxfc2NoZWRfaW4oc3RydWN0IHRhc2tfc3RydWN0ICp0
c2spIHt9CiBzdGF0aWMgaW5saW5lIHZvaWQgcmVzY3RybF9jcHVfZGV0ZWN0KHN0cnVjdCBjcHVp
bmZvX3g4NiAqYykge30KIAogI2VuZGlmIC8qIENPTkZJR19YODZfQ1BVX1JFU0NUUkwgKi8KZGlm
ZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC9jcHUvcmVzY3RybC9yZHRncm91cC5jIGIvYXJjaC94
ODYva2VybmVsL2NwdS9yZXNjdHJsL3JkdGdyb3VwLmMKaW5kZXggZTJjMTU5OWQxYjM3Li44ODRi
NmU5YTdlMzEgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2tlcm5lbC9jcHUvcmVzY3RybC9yZHRncm91
cC5jCisrKyBiL2FyY2gveDg2L2tlcm5lbC9jcHUvcmVzY3RybC9yZHRncm91cC5jCkBAIC0zMTQs
NyArMzE0LDcgQEAgc3RhdGljIHZvaWQgdXBkYXRlX2NwdV9jbG9zaWRfcm1pZCh2b2lkICppbmZv
KQogCSAqIGV4ZWN1dGluZyB0YXNrIG1pZ2h0IGhhdmUgaXRzIG93biBjbG9zaWQgc2VsZWN0ZWQu
IEp1c3QgcmV1c2UKIAkgKiB0aGUgY29udGV4dCBzd2l0Y2ggY29kZS4KIAkgKi8KLQlyZXNjdHJs
X3NjaGVkX2luKCk7CisJcmVzY3RybF9zY2hlZF9pbihjdXJyZW50KTsKIH0KIAogLyoKQEAgLTUz
MCw3ICs1MzAsNyBAQCBzdGF0aWMgdm9pZCBfdXBkYXRlX3Rhc2tfY2xvc2lkX3JtaWQodm9pZCAq
dGFzaykKIAkgKiBPdGhlcndpc2UsIHRoZSBNU1IgaXMgdXBkYXRlZCB3aGVuIHRoZSB0YXNrIGlz
IHNjaGVkdWxlZCBpbi4KIAkgKi8KIAlpZiAodGFzayA9PSBjdXJyZW50KQotCQlyZXNjdHJsX3Nj
aGVkX2luKCk7CisJCXJlc2N0cmxfc2NoZWRfaW4odGFzayk7CiB9CiAKIHN0YXRpYyB2b2lkIHVw
ZGF0ZV90YXNrX2Nsb3NpZF9ybWlkKHN0cnVjdCB0YXNrX3N0cnVjdCAqdCkKZGlmZiAtLWdpdCBh
L2FyY2gveDg2L2tlcm5lbC9wcm9jZXNzXzMyLmMgYi9hcmNoL3g4Ni9rZXJuZWwvcHJvY2Vzc18z
Mi5jCmluZGV4IDQ3MGMxMjg3NTllYS4uNzA4Yzg3Yjg4Y2MxIDEwMDY0NAotLS0gYS9hcmNoL3g4
Ni9rZXJuZWwvcHJvY2Vzc18zMi5jCisrKyBiL2FyY2gveDg2L2tlcm5lbC9wcm9jZXNzXzMyLmMK
QEAgLTIxMiw3ICsyMTIsNyBAQCBfX3N3aXRjaF90byhzdHJ1Y3QgdGFza19zdHJ1Y3QgKnByZXZf
cCwgc3RydWN0IHRhc2tfc3RydWN0ICpuZXh0X3ApCiAJc3dpdGNoX2ZwdV9maW5pc2goKTsKIAog
CS8qIExvYWQgdGhlIEludGVsIGNhY2hlIGFsbG9jYXRpb24gUFFSIE1TUi4gKi8KLQlyZXNjdHJs
X3NjaGVkX2luKCk7CisJcmVzY3RybF9zY2hlZF9pbihuZXh0X3ApOwogCiAJcmV0dXJuIHByZXZf
cDsKIH0KZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC9wcm9jZXNzXzY0LmMgYi9hcmNoL3g4
Ni9rZXJuZWwvcHJvY2Vzc182NC5jCmluZGV4IDRlMzRiM2I2OGViZC4uYmI2NWE2OGI0YjQ5IDEw
MDY0NAotLS0gYS9hcmNoL3g4Ni9rZXJuZWwvcHJvY2Vzc182NC5jCisrKyBiL2FyY2gveDg2L2tl
cm5lbC9wcm9jZXNzXzY0LmMKQEAgLTY1Niw3ICs2NTYsNyBAQCBfX3N3aXRjaF90byhzdHJ1Y3Qg
dGFza19zdHJ1Y3QgKnByZXZfcCwgc3RydWN0IHRhc2tfc3RydWN0ICpuZXh0X3ApCiAJfQogCiAJ
LyogTG9hZCB0aGUgSW50ZWwgY2FjaGUgYWxsb2NhdGlvbiBQUVIgTVNSLiAqLwotCXJlc2N0cmxf
c2NoZWRfaW4oKTsKKwlyZXNjdHJsX3NjaGVkX2luKG5leHRfcCk7CiAKIAlyZXR1cm4gcHJldl9w
OwogfQo=
--000000000000148e7005f655ca63--
