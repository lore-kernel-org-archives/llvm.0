Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEEB3FC4
	for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 18:30:23 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id r3so427329ljc.4
        for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 11:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DMEPb2641qLKswC+CKlATMdJ94cYSqVGjAMmVVHdy5g=;
        b=hcwUmJZ6+FYi8jSBVC4ea7F0juz+F5SDfcpaN7tUNGeYZPAVM54dOmgtwt7CAeN1Qo
         qqfEcPpCE13MJrkP6+79gWSLNEyoKOgA2Z2Epp1VXsDw05vk4RFWkjCs/3u5A0dmmAk8
         uCOTJ69KIdw3rPtR6t3Y0sRxBP+PkT3S/pAo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DMEPb2641qLKswC+CKlATMdJ94cYSqVGjAMmVVHdy5g=;
        b=q9DDWf9cqFKdnKo8I/U7C1YW29z6qTO8GY04mbaqU+yBP5Z5ttf7TrWzKWcPRE6+i6
         leeDJEJAV3ronTi0YPCvcmWbm2K7pDbrpbv/r0O90yZGX76ZHF5NqRXllHCLLCfktB9s
         TTI8dqnmSF+rEy8rsQAptqOSeOReJ99uv8xX/X9wkzexFbMvgaw2fD0ABwmDeE8WTFH+
         WleGQ6tNpHkR+rQJGLxkAjxrmssDaNOA7Er1F+pJ090+YY0N7Uo2ThH7RdSWLprwgGdm
         lCezpT/CSzp+WibShZ7dFRNwA1aDmxqmG0RcfEHAoHfxeGO4VCfwhuKMltsaLg2OHIgY
         Oh7Q==
X-Gm-Message-State: AOAM531/Y3VsO5zfTwFfM/s5KD2HkCpk0UImz4kc8NTTEaKIbtkyRYAg
	/SAa81B4mjLJc348gfEQohGDLHXYFLU+W45eNNA=
X-Google-Smtp-Source: ABdhPJyLQpINJwAqIEBCq82SWw1gVkdpM6kJwSHKDQyJvjMZ1ljPnjSQE4/LT3pfoCqAYXW8C4m4bQ==
X-Received: by 2002:a2e:a726:: with SMTP id s38mr16632022lje.386.1631644221527;
        Tue, 14 Sep 2021 11:30:21 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id s30sm699235lfb.90.2021.09.14.11.30.20
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Sep 2021 11:30:20 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id j12so308358ljg.10
        for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 11:30:20 -0700 (PDT)
X-Received: by 2002:a2e:8185:: with SMTP id e5mr16184714ljg.31.1631644219944;
 Tue, 14 Sep 2021 11:30:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210913203201.1844253-1-ndesaulniers@google.com>
 <195b2f47-b92e-a00b-a2bc-d91bfdbd9d12@rasmusvillemoes.dk> <202109141031.AEFD06F03F@keescook>
 <CAHk-=wjac_3K+NQNO6tjQZU1KLgba==BOvHmHE2sgNSVj3j85g@mail.gmail.com>
In-Reply-To: <CAHk-=wjac_3K+NQNO6tjQZU1KLgba==BOvHmHE2sgNSVj3j85g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 14 Sep 2021 11:30:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=whiQBofgis_rkniz8GBP9wZtSZdcDEffgSLO62BUGV3gg@mail.gmail.com>
Message-ID: <CAHk-=whiQBofgis_rkniz8GBP9wZtSZdcDEffgSLO62BUGV3gg@mail.gmail.com>
Subject: Re: [PATCH 5.10] overflow.h: use new generic division helpers to
 avoid / operator
To: Kees Cook <keescook@chromium.org>, Josef Bacik <josef@toxicpanda.com>, 
	Jens Axboe <axboe@kernel.dk>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Nick Desaulniers <ndesaulniers@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, llvm@lists.linux.dev, 
	stable <stable@vger.kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
	Naresh Kamboju <naresh.kamboju@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Pavel Machek <pavel@ucw.cz>
Content-Type: multipart/mixed; boundary="00000000000021a5b305cbf8c607"

--00000000000021a5b305cbf8c607
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 14, 2021 at 11:14 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> All this pain could have been trivially avoided with just people
> writing better code, knowing that multiplies and divides are
> expensive, and that shift counts are small and cheap.

IOW, maybe the fix is just this attached trivial patch.

I didn't bother to change the order of the 'struct ndb_config'
structure. It would pack better if you put the (now 32-bit)
blksize_bits field next to the 'atomic_t' field, I think. But I wanted
to just see how a minimal patch looks.

I did make the debugfs interface reflect the change to blocksize_bits,
so this is visible in user space. But it's debugfs.

If people care, it could be made to use a DEFINE_SHOW_ATTRIBUTE()
function the way it already does for 'flags', so that's not a
fundamental issue, I just didn't bother.

Hmm?

Btw, I really think more of the block layer should perhaps think about
use bit shifts more, not expanded values.  Can things like the queue
'discard_alignment' really be non-powers-of-two?

          Linus

--00000000000021a5b305cbf8c607
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_ktketv320>
X-Attachment-Id: f_ktketv320

IGRyaXZlcnMvYmxvY2svbmJkLmMgfCAzMCArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2Jsb2NrL25iZC5jIGIvZHJpdmVycy9ibG9jay9uYmQuYwppbmRleCA1
MTcwYTYzMDc3OGQuLjllMTJlZGY4OTJkNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ibG9jay9uYmQu
YworKysgYi9kcml2ZXJzL2Jsb2NrL25iZC5jCkBAIC05NywxMyArOTcsMTggQEAgc3RydWN0IG5i
ZF9jb25maWcgewogCiAJYXRvbWljX3QgcmVjdl90aHJlYWRzOwogCXdhaXRfcXVldWVfaGVhZF90
IHJlY3Zfd3E7Ci0JbG9mZl90IGJsa3NpemU7CisJdW5zaWduZWQgYmxrc2l6ZV9iaXRzOwogCWxv
ZmZfdCBieXRlc2l6ZTsKICNpZiBJU19FTkFCTEVEKENPTkZJR19ERUJVR19GUykKIAlzdHJ1Y3Qg
ZGVudHJ5ICpkYmdfZGlyOwogI2VuZGlmCiB9OwogCitzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGlu
dCBuYmRfYmxrc2l6ZShzdHJ1Y3QgbmJkX2NvbmZpZyAqY29uZmlnKQoreworCXJldHVybiAxdSA8
PCBjb25maWctPmJsa3NpemVfYml0czsKK30KKwogc3RydWN0IG5iZF9kZXZpY2UgewogCXN0cnVj
dCBibGtfbXFfdGFnX3NldCB0YWdfc2V0OwogCkBAIC0xNDYsNyArMTUxLDcgQEAgc3RhdGljIHN0
cnVjdCBkZW50cnkgKm5iZF9kYmdfZGlyOwogCiAjZGVmaW5lIE5CRF9NQUdJQyAweDY4Nzk3NTQ4
CiAKLSNkZWZpbmUgTkJEX0RFRl9CTEtTSVpFIDEwMjQKKyNkZWZpbmUgTkJEX0RFRl9CTEtTSVpF
X0JJVFMgMTAKIAogc3RhdGljIHVuc2lnbmVkIGludCBuYmRzX21heCA9IDE2Owogc3RhdGljIGlu
dCBtYXhfcGFydCA9IDE2OwpAQCAtMzE3LDEyICszMjIsMTIgQEAgc3RhdGljIGludCBuYmRfc2V0
X3NpemUoc3RydWN0IG5iZF9kZXZpY2UgKm5iZCwgbG9mZl90IGJ5dGVzaXplLAogCQlsb2ZmX3Qg
Ymxrc2l6ZSkKIHsKIAlpZiAoIWJsa3NpemUpCi0JCWJsa3NpemUgPSBOQkRfREVGX0JMS1NJWkU7
CisJCWJsa3NpemUgPSAxdSA8PCBOQkRfREVGX0JMS1NJWkVfQklUUzsKIAlpZiAoYmxrc2l6ZSA8
IDUxMiB8fCBibGtzaXplID4gUEFHRV9TSVpFIHx8ICFpc19wb3dlcl9vZl8yKGJsa3NpemUpKQog
CQlyZXR1cm4gLUVJTlZBTDsKIAogCW5iZC0+Y29uZmlnLT5ieXRlc2l6ZSA9IGJ5dGVzaXplOwot
CW5iZC0+Y29uZmlnLT5ibGtzaXplID0gYmxrc2l6ZTsKKwluYmQtPmNvbmZpZy0+Ymxrc2l6ZV9i
aXRzID0gX19mZnMoYmxrc2l6ZSk7CiAKIAlpZiAoIW5iZC0+dGFza19yZWN2KQogCQlyZXR1cm4g
MDsKQEAgLTEzMzcsNyArMTM0Miw3IEBAIHN0YXRpYyBpbnQgbmJkX3N0YXJ0X2RldmljZShzdHJ1
Y3QgbmJkX2RldmljZSAqbmJkKQogCQlhcmdzLT5pbmRleCA9IGk7CiAJCXF1ZXVlX3dvcmsobmJk
LT5yZWN2X3dvcmtxLCAmYXJncy0+d29yayk7CiAJfQotCXJldHVybiBuYmRfc2V0X3NpemUobmJk
LCBjb25maWctPmJ5dGVzaXplLCBjb25maWctPmJsa3NpemUpOworCXJldHVybiBuYmRfc2V0X3Np
emUobmJkLCBjb25maWctPmJ5dGVzaXplLCBuYmRfYmxrc2l6ZShjb25maWcpKTsKIH0KIAogc3Rh
dGljIGludCBuYmRfc3RhcnRfZGV2aWNlX2lvY3RsKHN0cnVjdCBuYmRfZGV2aWNlICpuYmQsIHN0
cnVjdCBibG9ja19kZXZpY2UgKmJkZXYpCkBAIC0xNDA2LDExICsxNDExLDEyIEBAIHN0YXRpYyBp
bnQgX19uYmRfaW9jdGwoc3RydWN0IGJsb2NrX2RldmljZSAqYmRldiwgc3RydWN0IG5iZF9kZXZp
Y2UgKm5iZCwKIAljYXNlIE5CRF9TRVRfQkxLU0laRToKIAkJcmV0dXJuIG5iZF9zZXRfc2l6ZShu
YmQsIGNvbmZpZy0+Ynl0ZXNpemUsIGFyZyk7CiAJY2FzZSBOQkRfU0VUX1NJWkU6Ci0JCXJldHVy
biBuYmRfc2V0X3NpemUobmJkLCBhcmcsIGNvbmZpZy0+Ymxrc2l6ZSk7CisJCXJldHVybiBuYmRf
c2V0X3NpemUobmJkLCBhcmcsIG5iZF9ibGtzaXplKGNvbmZpZykpOwogCWNhc2UgTkJEX1NFVF9T
SVpFX0JMT0NLUzoKLQkJaWYgKGNoZWNrX211bF9vdmVyZmxvdygobG9mZl90KWFyZywgY29uZmln
LT5ibGtzaXplLCAmYnl0ZXNpemUpKQorCQlieXRlc2l6ZSA9IGFyZyA8PCBjb25maWctPmJsa3Np
emVfYml0czsKKwkJaWYgKGJ5dGVzaXplID4+IGNvbmZpZy0+Ymxrc2l6ZV9iaXRzICE9IGFyZykK
IAkJCXJldHVybiAtRUlOVkFMOwotCQlyZXR1cm4gbmJkX3NldF9zaXplKG5iZCwgYnl0ZXNpemUs
IGNvbmZpZy0+Ymxrc2l6ZSk7CisJCXJldHVybiBuYmRfc2V0X3NpemUobmJkLCBieXRlc2l6ZSwg
bmJkX2Jsa3NpemUoY29uZmlnKSk7CiAJY2FzZSBOQkRfU0VUX1RJTUVPVVQ6CiAJCW5iZF9zZXRf
Y21kX3RpbWVvdXQobmJkLCBhcmcpOwogCQlyZXR1cm4gMDsKQEAgLTE0NzYsNyArMTQ4Miw3IEBA
IHN0YXRpYyBzdHJ1Y3QgbmJkX2NvbmZpZyAqbmJkX2FsbG9jX2NvbmZpZyh2b2lkKQogCWF0b21p
Y19zZXQoJmNvbmZpZy0+cmVjdl90aHJlYWRzLCAwKTsKIAlpbml0X3dhaXRxdWV1ZV9oZWFkKCZj
b25maWctPnJlY3Zfd3EpOwogCWluaXRfd2FpdHF1ZXVlX2hlYWQoJmNvbmZpZy0+Y29ubl93YWl0
KTsKLQljb25maWctPmJsa3NpemUgPSBOQkRfREVGX0JMS1NJWkU7CisJY29uZmlnLT5ibGtzaXpl
X2JpdHMgPSBOQkRfREVGX0JMS1NJWkVfQklUUzsKIAlhdG9taWNfc2V0KCZjb25maWctPmxpdmVf
Y29ubmVjdGlvbnMsIDApOwogCXRyeV9tb2R1bGVfZ2V0KFRISVNfTU9EVUxFKTsKIAlyZXR1cm4g
Y29uZmlnOwpAQCAtMTYwNCw3ICsxNjEwLDcgQEAgc3RhdGljIGludCBuYmRfZGV2X2RiZ19pbml0
KHN0cnVjdCBuYmRfZGV2aWNlICpuYmQpCiAJZGVidWdmc19jcmVhdGVfZmlsZSgidGFza3MiLCAw
NDQ0LCBkaXIsIG5iZCwgJm5iZF9kYmdfdGFza3NfZm9wcyk7CiAJZGVidWdmc19jcmVhdGVfdTY0
KCJzaXplX2J5dGVzIiwgMDQ0NCwgZGlyLCAmY29uZmlnLT5ieXRlc2l6ZSk7CiAJZGVidWdmc19j
cmVhdGVfdTMyKCJ0aW1lb3V0IiwgMDQ0NCwgZGlyLCAmbmJkLT50YWdfc2V0LnRpbWVvdXQpOwot
CWRlYnVnZnNfY3JlYXRlX3U2NCgiYmxvY2tzaXplIiwgMDQ0NCwgZGlyLCAmY29uZmlnLT5ibGtz
aXplKTsKKwlkZWJ1Z2ZzX2NyZWF0ZV91MzIoImJsb2Nrc2l6ZV9iaXRzIiwgMDQ0NCwgZGlyLCAm
Y29uZmlnLT5ibGtzaXplX2JpdHMpOwogCWRlYnVnZnNfY3JlYXRlX2ZpbGUoImZsYWdzIiwgMDQ0
NCwgZGlyLCBuYmQsICZuYmRfZGJnX2ZsYWdzX2ZvcHMpOwogCiAJcmV0dXJuIDA7CkBAIC0xODI2
LDcgKzE4MzIsNyBAQCBuYmRfZGV2aWNlX3BvbGljeVtOQkRfREVWSUNFX0FUVFJfTUFYICsgMV0g
PSB7CiBzdGF0aWMgaW50IG5iZF9nZW5sX3NpemVfc2V0KHN0cnVjdCBnZW5sX2luZm8gKmluZm8s
IHN0cnVjdCBuYmRfZGV2aWNlICpuYmQpCiB7CiAJc3RydWN0IG5iZF9jb25maWcgKmNvbmZpZyA9
IG5iZC0+Y29uZmlnOwotCXU2NCBic2l6ZSA9IGNvbmZpZy0+Ymxrc2l6ZTsKKwl1NjQgYnNpemUg
PSBuYmRfYmxrc2l6ZShjb25maWcpOwogCXU2NCBieXRlcyA9IGNvbmZpZy0+Ynl0ZXNpemU7CiAK
IAlpZiAoaW5mby0+YXR0cnNbTkJEX0FUVFJfU0laRV9CWVRFU10pCkBAIC0xODM1LDcgKzE4NDEs
NyBAQCBzdGF0aWMgaW50IG5iZF9nZW5sX3NpemVfc2V0KHN0cnVjdCBnZW5sX2luZm8gKmluZm8s
IHN0cnVjdCBuYmRfZGV2aWNlICpuYmQpCiAJaWYgKGluZm8tPmF0dHJzW05CRF9BVFRSX0JMT0NL
X1NJWkVfQllURVNdKQogCQlic2l6ZSA9IG5sYV9nZXRfdTY0KGluZm8tPmF0dHJzW05CRF9BVFRS
X0JMT0NLX1NJWkVfQllURVNdKTsKIAotCWlmIChieXRlcyAhPSBjb25maWctPmJ5dGVzaXplIHx8
IGJzaXplICE9IGNvbmZpZy0+Ymxrc2l6ZSkKKwlpZiAoYnl0ZXMgIT0gY29uZmlnLT5ieXRlc2l6
ZSB8fCBic2l6ZSAhPSBuYmRfYmxrc2l6ZShjb25maWcpKQogCQlyZXR1cm4gbmJkX3NldF9zaXpl
KG5iZCwgYnl0ZXMsIGJzaXplKTsKIAlyZXR1cm4gMDsKIH0K
--00000000000021a5b305cbf8c607--
