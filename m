Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E117B
	for <llvm@lists.linux.dev>; Sat,  3 Sep 2022 06:45:32 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id o12so1927134vkn.7
        for <llvm@lists.linux.dev>; Fri, 02 Sep 2022 23:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=TIdUaIE9yD+5UCvf+QeOEmAM8YZj0pGyCs5cGC4JBXI=;
        b=O2eVmiAYQblOkyUjWZMSY4yGn64KSEtqE2KDQVuAMytLuFcXnl9Hctsj3zxPIuYhk7
         aB3tmqghZjVFHFduwDqgB4VcTjJrBnc4fn15oTp2p7iwHFWsLkArs+M5jte6weaNxnl/
         ++HrJTCI1OpOzCFqTcfM6JEIfQ44tW5tS0buCX2HzFmDPnVKT4f5X/1eu8V0s6DMtue8
         Hupdj+/SQQAje+q7yBmyKiFRQHe8doES/IoXhWBP8ApRG8uKUbL4NP360CVltPIPvtCi
         xN8bn6KsK4O6Wi/eylRhfPYoZlDYKzf1wcUMH6ZCsMsZ7JSow2mQo4piQaHrSaDdF8IB
         4phg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=TIdUaIE9yD+5UCvf+QeOEmAM8YZj0pGyCs5cGC4JBXI=;
        b=NmJ4ODOt3a9XrYouWP1cWZMQzg9c+j0uthdvXUUbVlpMpX9sU8dRTVhbyO74e0IVIO
         PssQ1oQ3zLQ16eYTmwclERzBTKax1zZzjFRRa5qDFbCFOm0fgL2EnqwSiaGiPchCpLW8
         wldPP6Cx+ZdzHy/kyhNvkWKE2iim8nV2uoR+BTWjsfRXt0/nX+cjDEqsW/4cGHYJqjD4
         qlH29pfyTvwi+5dls3zbOHFhK0C0IKKBxUjEaP0/MVCQPNvp1Ab3gUqvPhvhDr9vsxos
         C/8GvlmYuatlWdow9k3PtIi3vYQSCI/AzG0iwtDZ+6oTDXMLSuUD/sZA229umIR9o36z
         8xYA==
X-Gm-Message-State: ACgBeo0rK6xzpIOpwmLxdOdiItwxyg/sTkhsOWMMuoLb6DRQcTyFstq/
	bOjIaQX96AO0iAb5HQCJle62cdawAAlNDeB/If+l4Q==
X-Google-Smtp-Source: AA6agR6CAfqE4RrQk1cScGKT05CKlb+5KOzQ6Z32P3+2WVQTYigOoQDgHHb0s8wxB3Lyd0eh62kd10P/Jkpl2CFLfwM=
X-Received: by 2002:a05:6122:856:b0:399:ab13:5de7 with SMTP id
 22-20020a056122085600b00399ab135de7mr280872vkk.7.1662187531643; Fri, 02 Sep
 2022 23:45:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220902204351.2521805-1-keescook@chromium.org>
 <20220902204351.2521805-3-keescook@chromium.org> <CABVgOS=Ru4Eu03T71svLA=j9jizGro44n3h59pQYw33QYPfLaQ@mail.gmail.com>
 <202209022215.FA016FA6@keescook>
In-Reply-To: <202209022215.FA016FA6@keescook>
From: David Gow <davidgow@google.com>
Date: Sat, 3 Sep 2022 14:45:20 +0800
Message-ID: <CABVgOSm76QgfbwZ63cSb58=K5EqK+MuLs=-siwUgg7JMNFkQ2g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] fortify: Add KUnit test for FORTIFY_SOURCE internals
To: Kees Cook <keescook@chromium.org>
Cc: Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, Yury Norov <yury.norov@gmail.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Sander Vanheule <sander@svanheule.net>, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Dan Williams <dan.j.williams@intel.com>, Isabella Basso <isabbasso@riseup.net>, 
	Eric Dumazet <edumazet@google.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Eric Biggers <ebiggers@google.com>, Hannes Reinecke <hare@suse.de>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000637cc305e7c03131"

--000000000000637cc305e7c03131
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 3, 2022 at 1:17 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Sat, Sep 03, 2022 at 10:59:24AM +0800, David Gow wrote:
> > On Sat, Sep 3, 2022 at 4:43 AM Kees Cook <keescook@chromium.org> wrote:
> > >
> > > Add lib/fortify_kunit.c KUnit test for checking the expected behavioral
> > > characteristics of FORTIFY_SOURCE internals.
> > > [...]
> >
> > Overall, this looks good. It's a bit of a shame FORTIFY_SOURCE doesn't
> > work under UML, but I tested it on everything else I had to hand and
> > it looked good.
>
> It looks like this was never picked up:
> https://lore.kernel.org/lkml/20220210003224.773957-1-keescook@chromium.org/

Ah: I'd forgotten about that. Can confirm this test works under UML
with that patch applied.

Cheers,
-- David

--000000000000637cc305e7c03131
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIPnwYJKoZIhvcNAQcCoIIPkDCCD4wCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ggz5MIIEtjCCA56gAwIBAgIQeAMYYHb81ngUVR0WyMTzqzANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA3MjgwMDAwMDBaFw0yOTAzMTgwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFIzIFNNSU1FIENBIDIwMjAwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCvLe9xPU9W
dpiHLAvX7kFnaFZPuJLey7LYaMO8P/xSngB9IN73mVc7YiLov12Fekdtn5kL8PjmDBEvTYmWsuQS
6VBo3vdlqqXZ0M9eMkjcKqijrmDRleudEoPDzTumwQ18VB/3I+vbN039HIaRQ5x+NHGiPHVfk6Rx
c6KAbYceyeqqfuJEcq23vhTdium/Bf5hHqYUhuJwnBQ+dAUcFndUKMJrth6lHeoifkbw2bv81zxJ
I9cvIy516+oUekqiSFGfzAqByv41OrgLV4fLGCDH3yRh1tj7EtV3l2TngqtrDLUs5R+sWIItPa/4
AJXB1Q3nGNl2tNjVpcSn0uJ7aFPbAgMBAAGjggGKMIIBhjAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0l
BBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFHzM
CmjXouseLHIb0c1dlW+N+/JjMB8GA1UdIwQYMBaAFI/wS3+oLkUkrk1Q+mOai97i3Ru8MHsGCCsG
AQUFBwEBBG8wbTAuBggrBgEFBQcwAYYiaHR0cDovL29jc3AyLmdsb2JhbHNpZ24uY29tL3Jvb3Ry
MzA7BggrBgEFBQcwAoYvaHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvcm9vdC1y
My5jcnQwNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9yb290LXIz
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
z/tQRXr3iPeVmZCr7nttMEwGA1UdIARFMEMwQQYJKwYBBAGgMgEoMDQwMgYIKwYBBQUHAgEWJmh0
dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQCMAAwgZoGCCsG
AQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9jYS9n
c2F0bGFzcjNzbWltZWNhMjAyMDBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5nbG9iYWxzaWdu
LmNvbS9jYWNlcnQvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3J0MB8GA1UdIwQYMBaAFHzMCmjXouse
LHIb0c1dlW+N+/JjMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20v
Y2EvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3JsMA0GCSqGSIb3DQEBCwUAA4IBAQAx+EQjLATc/sze
VoZkH7OLz+/no1+y31x4BQ3wjW7lKfay9DAAVym896b7ECttSo95GEvS7pYMikzud57WypK7Bjpi
ep8YLarLRDrvyyvBuYtyDrIewkuASHtV1oy5E6QZZe2VOxMm6e2oJnFFjbflot4A08D3SwqDwV0i
OOYwT0BUtHYR/3903Dmdx5Alq+NDvUHDjozgo0f6oIkwDXT3yBV36utQ/jFisd36C8RD5mM+NFpu
3aqLXARRbKtxw29ErCwulof2dcAonG7cd5j+gmS84sLhKU+BhL1OQVXnJ5tj7xZ5Ri5I23brcwk0
lk/gWqfgs3ppT9Xk7zVit9q8MYICajCCAmYCAQEwaDBUMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQ
R2xvYmFsU2lnbiBudi1zYTEqMCgGA1UEAxMhR2xvYmFsU2lnbiBBdGxhcyBSMyBTTUlNRSBDQSAy
MDIwAhABh9LgIPnlfMFHR0Die8n7MA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCA4
vJlRhCn/eRNC9CO2QPK+UWfc1qWkFVS70yh/rqlhIDAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMjA5MDMwNjQ1MzFaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAAwpfbo/cYShe26SclTS2
k3aNWFPXngC4AiWrTJTOi/1kY6PQz2Uqc1g+yj2qmqqz46XDcpCjDo7X62CVxMdpVg1TwSNILCfi
sApUDDKljWj+OHgRyZiUJXq5p16xHfoSyLQ6Ttyw2D6GV/PTOycgFv02ClxUBbJhO46/zG6IurNs
vo1i/RD+2uU0JJu1Mr8SSNg2HXEACISIbqH2otyiOAH7UoIRivgc+kQGZdEFOIM3f1yGe63MP9Ay
jRHLXG3X2EIJsVUtbfI+SlizgiUs/644dfnybruDA53q9cf1wzn/GtYDGrqnW7e4aYbAb7rGOP2v
kIKvci6oLwZYVlzQ/g==
--000000000000637cc305e7c03131--
