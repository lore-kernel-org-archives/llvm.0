Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C833F2C81
	for <llvm@lists.linux.dev>; Fri, 19 Nov 2021 22:29:22 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id t26so49456253lfk.9
        for <llvm@lists.linux.dev>; Fri, 19 Nov 2021 14:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EDW4syYNAtTu07Zje9Yf7tN8HiRrmtT7x8jt/tno8Mc=;
        b=mKPm9uxYBAjMkZ8EkhBWgXiG8l5yimPyznkhQM4lZwybnDUQAjpJRiiz05MChN4uI7
         IJZFnQkN6191WpoY7ttLtYSmpxB/ww9Ti6XAnihP3FlNCCejQsROgzMcGbFTTwlvTDHf
         Z2UU2T0GNb20iRKdH44J9+kd6NwduIaZWb5PBU2STfAJRmCpz0uzcW9mkjQETkC/aGX1
         vIs8JUbpxBwg4NxHlzhX5RDFUD2ydApSqqpxdlr0iC6I+oCzIbHuRF3ItcXr+MU/Fx5y
         KEWij4xWOodQetbUHZlLcejCMDuipGL3TtYMk1B8pAy0N/+d65LcLDsVkcbPpetcbTiE
         rasQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EDW4syYNAtTu07Zje9Yf7tN8HiRrmtT7x8jt/tno8Mc=;
        b=1P9LuHNoagp1/U5yQI/t70PSFutEvopSXQD6VAhnxOl4w4j4vNx5GHY0X5WE3QTVQE
         02AI4l1vv100UIwxCnsmeWIy4omLax9WYBEY4SWI1ir/Uf8RvA5peV/3e+xzWePjUHc4
         1paTzln77IJAxQfiZqXg6ZVEaCvLbpPvO3FPLKkyfNOvbKqaWVge/+1iSrc6QzEVGiQi
         Et7PoH5XC+S7KHE68h1ZeIX680ik+5uYIZ4Qnlm99i4xCEitbTD1IqtdyCKypvHtUjRR
         l+HKUTOQp2LwvU45FYBzeDXw2Xd4m8Aps50COaWZLpp8K7uyFsph5vXxQp2Y6opN5h5e
         KPew==
X-Gm-Message-State: AOAM530z3Aw+ZZTjV07UgupZkdj/MUm8ZhKsAe26mVVhYNimdly4tpaS
	TCv8wQUTLD+qGQADfdL/lTAoyvF1/6Z2E+TFAnWjxw==
X-Google-Smtp-Source: ABdhPJxC1rNvQabwkVZw/7XFuXFX/0lIprBjqcbChdje0gP9jUW8uAeGMZApcMUg7I9vl9LYKb2TMZKqyMzGXCY+aB4=
X-Received: by 2002:a05:6512:110e:: with SMTP id l14mr37262522lfg.550.1637360960683;
 Fri, 19 Nov 2021 14:29:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdmaGrk80s5T9uDMd-XEVTOUupaCxiU1mbtkk9K276KS5w@mail.gmail.com>
 <YZem/VtituWK2zkd@kroah.com>
In-Reply-To: <YZem/VtituWK2zkd@kroah.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 19 Nov 2021 14:29:09 -0800
Message-ID: <CAKwvOdkZ1ydLs2VwvVLtT7QK+e1gNB0ZE5RqTxMY15QQvhxZ1w@mail.gmail.com>
Subject: Re: backport of 14831fad73f5 for 5.10 and 5.4
To: Greg KH <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: "# 3.4.x" <stable@vger.kernel.org>, Lucas Henneman <henneman@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Will Deacon <will@kernel.org>, llvm@lists.linux.dev, 
	Pavel Machek <pavel@denx.de>
Content-Type: multipart/mixed; boundary="0000000000006ed1d505d12bce53"

--0000000000006ed1d505d12bce53
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 19, 2021 at 5:30 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Nov 18, 2021 at 11:30:38AM -0800, Nick Desaulniers wrote:
> > Dear stable kernel maintainers,
> > Please consider applying the attached backport of 14831fad73f5 to
> > linux-5.10.y and linux-5.4.y.
> >
> > 14831fad73f5 first landed in v5.16-rc1.
> >
> > There was a minor conflict due to missing e35123d83ee3 ("arm64: lto:
> > Strengthen READ_ONCE() to acquire when CONFIG_LTO=y") which first
> > landed in v5.11-rc1.
> >
> > It fixes a minor warning observed during `make mrproper` for Android
> > kernel builds.
>
> Now queued up, thanks.

I'm sorry; I made a mistake.  As reported by Pavel in
https://lore.kernel.org/stable/20211119214713.GB23353@amd/
I missed part of the backport.  Attached is a v2.
-- 
Thanks,
~Nick Desaulniers

--0000000000006ed1d505d12bce53
Content-Type: application/octet-stream; 
	name="v2.14831fad73f5.5.10.and.5.4.patch"
Content-Disposition: attachment; 
	filename="v2.14831fad73f5.5.10.and.5.4.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kw6yf34h0>
X-Attachment-Id: f_kw6yf34h0

RnJvbSBiNjZjZDYyNGQwZDU5MTIwNTA1MzZkMzc3MDkwYzE2NDEzZTUzYjA0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBOaWNrIERlc2F1bG5pZXJzIDxuZGVzYXVsbmllcnNAZ29vZ2xl
LmNvbT4KRGF0ZTogVHVlLCAxOSBPY3QgMjAyMSAxNTozNjo0NSAtMDcwMApTdWJqZWN0OiBbUEFU
Q0hdIGFybTY0OiB2ZHNvMzI6IHN1cHByZXNzIGVycm9yIG1lc3NhZ2UgZm9yICdtYWtlIG1ycHJv
cGVyJwoKY29tbWl0IDE0ODMxZmFkNzNmNWFjMzBhYzYxNzYwNDg3ZDk1YTUzOGU2YWIzY2IgdXBz
dHJlYW0uCgpXaGVuIHJ1bm5pbmcgdGhlIGZvbGxvd2luZyBjb21tYW5kIHdpdGhvdXQgYXJtLWxp
bnV4LWdudWVhYmktZ2NjIGluCm9uZSdzICRQQVRILCB0aGUgZm9sbG93aW5nIHdhcm5pbmcgaXMg
b2JzZXJ2ZWQ6CgokIEFSQ0g9YXJtNjQgQ1JPU1NfQ09NUElMRV9DT01QQVQ9YXJtLWxpbnV4LWdu
dWVhYmktIG1ha2UgLWo3MiBMTFZNPTEgbXJwcm9wZXIKbWFrZVsxXTogYXJtLWxpbnV4LWdudWVh
YmktZ2NjOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5CgpUaGlzIGlzIGJlY2F1c2UgS0NPTkZJ
RyBpcyBub3QgcnVuIGZvciBtcnByb3Blciwgc28gQ09ORklHX0NDX0lTX0NMQU5HCmlzIG5vdCBz
ZXQsIGFuZCB3ZSBlbmQgdXAgZWFnZXJseSBldmFsdWF0aW5nIHZhcmlvdXMgdmFyaWFibGVzIHRo
YXQgdHJ5CnRvIGludm9rZSBDQ19DT01QQVQuCgpUaGlzIGlzIGEgc2ltaWxhciBwcm9ibGVtIHRv
IHdoYXQgd2FzIG9ic2VydmVkIGluCmNvbW1pdCBkYzk2MGJmZWVkYjAgKCJoODMwMDogc3VwcHJl
c3MgZXJyb3IgbWVzc2FnZXMgZm9yICdtYWtlIGNsZWFuJyIpCgpSZXBvcnRlZC1ieTogTHVjYXMg
SGVubmVtYW4gPGhlbm5lbWFuQGdvb2dsZS5jb20+ClN1Z2dlc3RlZC1ieTogTWFzYWhpcm8gWWFt
YWRhIDxtYXNhaGlyb3lAa2VybmVsLm9yZz4KW25kOiBhZGp1c3RlZCBjb250ZXh0IGR1ZSB0byBt
aXNzaW5nIGUzNTEyM2Q4M2VlM10KU2lnbmVkLW9mZi1ieTogTmljayBEZXNhdWxuaWVycyA8bmRl
c2F1bG5pZXJzQGdvb2dsZS5jb20+ClJldmlld2VkLWJ5OiBWaW5jZW56byBGcmFzY2lubyA8dmlu
Y2Vuem8uZnJhc2Npbm9AYXJtLmNvbT4KUmV2aWV3ZWQtYnk6IE5hdGhhbiBDaGFuY2VsbG9yIDxu
YXRoYW5Aa2VybmVsLm9yZz4KVGVzdGVkLWJ5OiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0aGFuQGtl
cm5lbC5vcmc+Ckxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMTEwMTkyMjM2NDYu
MTE0Njk0NS00LW5kZXNhdWxuaWVyc0Bnb29nbGUuY29tClNpZ25lZC1vZmYtYnk6IFdpbGwgRGVh
Y29uIDx3aWxsQGtlcm5lbC5vcmc+Ci0tLQogYXJjaC9hcm02NC9rZXJuZWwvdmRzbzMyL01ha2Vm
aWxlIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2tlcm5lbC92ZHNvMzIvTWFrZWZpbGUgYi9hcmNo
L2FybTY0L2tlcm5lbC92ZHNvMzIvTWFrZWZpbGUKaW5kZXggNzkyODBjNTNiOWE2Li5hNDYzYjli
Y2VlZDQgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQva2VybmVsL3Zkc28zMi9NYWtlZmlsZQorKysg
Yi9hcmNoL2FybTY0L2tlcm5lbC92ZHNvMzIvTWFrZWZpbGUKQEAgLTQ4LDcgKzQ4LDggQEAgY2Mz
Mi1hcy1pbnN0ciA9ICQoY2FsbCB0cnktcnVuLFwKICMgQXMgYSByZXN1bHQgd2Ugc2V0IG91ciBv
d24gZmxhZ3MgaGVyZS4KIAogIyBLQlVJTERfQ1BQRkxBR1MgYW5kIE5PU1RESU5DX0ZMQUdTIGZy
b20gdG9wLWxldmVsIE1ha2VmaWxlCi1WRFNPX0NQUEZMQUdTIDo9IC1EX19LRVJORUxfXyAtbm9z
dGRpbmMgLWlzeXN0ZW0gJChzaGVsbCAkKENDX0NPTVBBVCkgLXByaW50LWZpbGUtbmFtZT1pbmNs
dWRlKQorVkRTT19DUFBGTEFHUyA6PSAtRF9fS0VSTkVMX18gLW5vc3RkaW5jCitWRFNPX0NQUEZM
QUdTICs9IC1pc3lzdGVtICQoc2hlbGwgJChDQ19DT01QQVQpIC1wcmludC1maWxlLW5hbWU9aW5j
bHVkZSAyPi9kZXYvbnVsbCkKIFZEU09fQ1BQRkxBR1MgKz0gJChMSU5VWElOQ0xVREUpCiAKICMg
Q29tbW9uIEMgYW5kIGFzc2VtYmx5IGZsYWdzCi0tIAoyLjM0LjAucmMyLjM5My5nZjhjOTY2Njg4
MC1nb29nCgo=
--0000000000006ed1d505d12bce53--
