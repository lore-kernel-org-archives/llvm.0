Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0E92CA4
	for <llvm@lists.linux.dev>; Wed, 15 Dec 2021 23:50:37 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id k2so35746104lji.4
        for <llvm@lists.linux.dev>; Wed, 15 Dec 2021 15:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BvnUVA9KinbAmAkummF6AR6o92CdjauAjJz/D8y2ogE=;
        b=gtKoewFrMWho/e3gopobq6+1wom54dD0soV3W0Gv/DYstGtCTgRPRQxmQchT4SnFur
         X3OkZaXRViRAMd5GAanDoMASt/oScYiP6NZQgZHNku6FOPXsk1Rwm/ryWaqEFjxskoE0
         8DI/72OVLowibtdtQRYnZ+TKSo63WxuecY46b8Ngm+brAjKysD9gfNI0brCOKi9aOSul
         YEjME30s+n1rrSIlP1wBOvsrs2K7/EFr6YRoc+TlSm24S2O3ZlR0xv9L1h525dLYB8Aq
         eonPsJvaDbrMOU/UdDB8QX4P0CQS+rooibUfycxb6jrPX5IQP+ZGtXg6AtH5vWNyQ+wv
         8Gmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BvnUVA9KinbAmAkummF6AR6o92CdjauAjJz/D8y2ogE=;
        b=Kzh912Ipz4UbtKCtU9W5ElQKgLGOwPsV6DHK9bO3fHRpwWKpTnif/Q5lALLUvMRnwa
         urDCXvTWjJek+gLSR0H+FP6rdY3AWwf6ndaxXkjuq2jSMHaJLFk89DLVamFzJN5XZg5g
         x52Z/ObJ4bHeiI1ApbVLor9MtWQTL4m8sm2vWCufU+F/zVihN2i4oT7Z+guwpQZK4eOx
         WUrsZ72KlG6Rmsay/Co9iLb2D7W3eM8d0s8Ruy58SLZ2RmdSbhjELSMZU6nXHweYhSbT
         nUGo1uyihyko6h6R5Ab01B4dVIKJt/6p6zpJgsF5QSf+lfxxDYM6ljYCtRkVgkjY4r2c
         jrVQ==
X-Gm-Message-State: AOAM533h1ECFrEUsC7IEA0X9/qeGG5BBKIhgwISqzYcr0K6FHLblGFVr
	ASTRrZ+xt8pX+IcNWHCmisInP1hWJE34MTVJ+6EAjg==
X-Google-Smtp-Source: ABdhPJzmIji6GQ9BODxY67hzrXH3ZifndbDc8kcrraLrLddp/MDmi3O7YMP0bvwZjQtOKmS+opWkP+rmC1SS2575n3Q=
X-Received: by 2002:a2e:90d0:: with SMTP id o16mr12361249ljg.339.1639612235490;
 Wed, 15 Dec 2021 15:50:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <157245708.33559.1639605989199.JavaMail.zimbra@efficios.com>
In-Reply-To: <157245708.33559.1639605989199.JavaMail.zimbra@efficios.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 15 Dec 2021 15:50:23 -0800
Message-ID: <CAKwvOdkUhqt8eUQ_3HknXkF=6LBFY6Zc7rsXFPCT3GwNfmDoUQ@mail.gmail.com>
Subject: Re: clang asm goto issue small reproducer
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Peter Zijlstra <peterz@infradead.org>, llvm@lists.linux.dev, 
	Bill Wendling <morbo@google.com>, James Y Knight <jyknight@google.com>, 
	Eli Friedman <efriedma@quicinc.com>
Content-Type: multipart/mixed; boundary="000000000000de77da05d337f80c"

--000000000000de77da05d337f80c
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 15, 2021 at 2:06 PM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> Hi Nick,
>
> I have a small reproducer for the asm goto issue we discussed over irc. I have
> axed away all code that is not the problematic function by hand. Hopefully this
> won't change the overall optimization context too much.

If I cut the compilation pipeline off at after "middle-end"
optimizations, I can see that `this_cpu_list_pop` returns `NULL` for
test.c while in test-asm.c, it's a phi node of either NULL or head
(which looks correct; for the test-asm.c case).

"GVNPass" seems to be converting

return:                                           ; preds =
%cleanup.thread19, %cleanup.thread
  %retval.118 = phi %struct.percpu_list_node* [ %9, %cleanup.thread ],
[ null, %cleanup.thread19 ]
  ret %struct.percpu_list_node* %retval.118

into:

return:                                           ; preds =
%cleanup.thread19, %cleanup.thread
  ret %struct.percpu_list_node* null

Which drops the
  %9 = load %struct.percpu_list_node*, %struct.percpu_list_node**
%head, align 8, !tbaa !9

I think GVN may be eliminating a phi that it should not be.
Specifically, it seems that GVN thinks the default/fallthrough
successor is unreachable, which seems incorrect to me. The predecessor
lists all look correct to me, so GVN may be stumbling on callbr
itself.

$ clang -O2 test.c -emit-llvm -S -o - -Xclang -disable-llvm-passes > test.ll
$ opt -O2 -print-before=gvn -print-after=gvn
-filter-print-funcs=this_cpu_list_pop test.ll -o /dev/null 2>
test.gvn.ll

Then using this reproducer, I was able to narrow it down a little further:

$ opt -O2 -print-before=gvn -print-module-scope
--filter-print-funcs=this_cpu_list_pop test.ll -S 2>test.pre-gvn.ll
$ llvm-extract --func=this_cpu_list_pop test.pre-gvn.ll -o
test.pre-gvn.this_cpu_list_pop.bc --recursive
$ llvm-dis test.pre-gvn.this_cpu_list_pop.bc
$ cat repro.sh
#!/usr/bin/env sh
set -e
grep -q "%retval.118 = phi %struct.percpu_list_node\* \[ %9,
%cleanup.thread \], \[ null, %cleanup.thread19 \]" $1
grep -q "ret %struct.percpu_list_node\* %retval.118" $1
OUT=$(opt -passes=gvn $1 -S -o -)
echo $OUT | grep -q "ret %struct.percpu_list_node\* null"
$ llvm-reduce --test=./repro.sh test.pre-gvn.this_cpu_list_pop.ll

Then pared down further manually, see reduced.ll

I've filed https://github.com/llvm/llvm-project/issues/52735, let's
discuss more there?

>
> on x86-64:
>
> Buggy code:
> clang-13 -O2 -o test.o test.c
>
> OK code (added a dummy asm("")):
> clang-13 -O2 -o test-asm.o test-asm.c
>
> Thanks,
>
> Mathieu
>
> --
> Mathieu Desnoyers
> EfficiOS Inc.
> http://www.efficios.com



-- 
Thanks,
~Nick Desaulniers

--000000000000de77da05d337f80c
Content-Type: application/octet-stream; name="test.gvn.ll"
Content-Disposition: attachment; filename="test.gvn.ll"
Content-Transfer-Encoding: base64
Content-ID: <f_kx85ene20>
X-Attachment-Id: f_kx85ene20

KioqIElSIER1bXAgQmVmb3JlIEdWTlBhc3Mgb24gdGhpc19jcHVfbGlzdF9wb3AgKioqCjsgRnVu
Y3Rpb24gQXR0cnM6IG5vdW53aW5kIHV3dGFibGUKZGVmaW5lIGRzb19sb2NhbCAlc3RydWN0LnBl
cmNwdV9saXN0X25vZGUqIEB0aGlzX2NwdV9saXN0X3BvcCglc3RydWN0LnBlcmNwdV9saXN0KiAl
bGlzdCwgaTMyKiB3cml0ZW9ubHkgJV9jcHUpIGxvY2FsX3VubmFtZWRfYWRkciAjMCB7CmVudHJ5
OgogICVoZWFkID0gYWxsb2NhICVzdHJ1Y3QucGVyY3B1X2xpc3Rfbm9kZSosIGFsaWduIDgKICAl
MCA9IGJpdGNhc3QgJXN0cnVjdC5wZXJjcHVfbGlzdF9ub2RlKiogJWhlYWQgdG8gaTgqCiAgJTEg
PSB0YWlsIGNhbGwgaTgqIGFzbSAibW92ICVmczowLCAkMCIsICI9cix+e2RpcmZsYWd9LH57ZnBz
cn0sfntmbGFnc30iKCkgIzMsICFzcmNsb2MgITMKICAlMiA9IGxvYWQgaTMyLCBpMzIqIEByc2Vx
X29mZnNldCwgYWxpZ24gNCwgIXRiYWEgITQKICAlaWR4LmV4dC5pLmkxMSA9IHNleHQgaTMyICUy
IHRvIGk2NAogICVhZGQucHRyLmkuaTEyID0gZ2V0ZWxlbWVudHB0ciBpOCwgaTgqICUxLCBpNjQg
JWlkeC5leHQuaS5pMTEKICAlY3B1X2lkX3N0YXJ0LmkgPSBiaXRjYXN0IGk4KiAlYWRkLnB0ci5p
LmkxMiB0byBpMzIqCiAgJTMgPSBiaXRjYXN0ICVzdHJ1Y3QucGVyY3B1X2xpc3Rfbm9kZSoqICVo
ZWFkIHRvIGk2NCoKICAlNCA9IGJpdGNhc3QgaTgqICVhZGQucHRyLmkuaTEyIHRvICVzdHJ1Y3Qu
cnNlcSoKICBiciBsYWJlbCAlZm9yLmNvbmQKCmZvci5jb25kOiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgOyBwcmVkcyA9ICVjbGVhbnVwLCAlZW50cnkKICBjYWxsIHZv
aWQgQGxsdm0ubGlmZXRpbWUuc3RhcnQucDBpOChpNjQgOCwgaTgqIG5vbm51bGwgJTApICM0CiAg
JTUgPSBsb2FkIHZvbGF0aWxlIGkzMiwgaTMyKiAlY3B1X2lkX3N0YXJ0LmksIGFsaWduIDMyLCAh
dGJhYSAhNAogICVpZHhwcm9tID0gc2V4dCBpMzIgJTUgdG8gaTY0CiAgJWhlYWQxID0gZ2V0ZWxl
bWVudHB0ciBpbmJvdW5kcyAlc3RydWN0LnBlcmNwdV9saXN0LCAlc3RydWN0LnBlcmNwdV9saXN0
KiAlbGlzdCwgaTY0IDAsIGkzMiAwLCBpNjQgJWlkeHByb20sIGkzMiAwCiAgJTYgPSBiaXRjYXN0
ICVzdHJ1Y3QucGVyY3B1X2xpc3Rfbm9kZSoqICVoZWFkMSB0byBpNjQqCiAgY2FsbGJyIHZvaWQg
YXNtIHNpZGVlZmZlY3QgIi5wdXNoc2VjdGlvbiBfX3JzZXFfY3MsIFwyMmF3XDIyXDBBXDA5LmJh
bGlnbiAzMlwwQVwwOTM6XDBBXDA5LmxvbmcgMHgwLCAweDBcMEFcMDkucXVhZCAxZiwgKDJmIC0g
MWYpLCA0ZlwwQVwwOS5wb3BzZWN0aW9uXDBBXDA5LnB1c2hzZWN0aW9uIF9fcnNlcV9jc19wdHJf
YXJyYXksIFwyMmF3XDIyXDBBXDA5LnF1YWQgM2JcMEFcMDkucG9wc2VjdGlvblwwQVwwOS5wdXNo
c2VjdGlvbiBfX3JzZXFfZXhpdF9wb2ludF9hcnJheSwgXDIyYXdcMjJcMEFcMDkucXVhZCAxZiwg
JHs3Omx9XDBBXDA5LnBvcHNlY3Rpb25cMEFcMDlsZWFxIDNiKCVyaXApLCAlcmF4XDBBXDA5bW92
cSAlcmF4LCA4KCQxKVwwQVwwOTE6XDBBXDA5Y21wbCAkMCwgNCgkMSlcMEFcMDlqbnogNGZcMEFc
MDltb3ZxICQyLCAlcmJ4XDBBXDA5Y21wcSAlcmJ4LCAkM1wwQVwwOWplICR7NzpsfVwwQVwwOW1v
dnEgJXJieCwgJDVcMEFcMDlhZGRxICQ0LCAlcmJ4XDBBXDA5bW92cSAoJXJieCksICVyYnhcMEFc
MDl1ZDJcMEFcMDltb3ZxICVyYngsICQyXDBBXDA5MjpcMEFcMDkucHVzaHNlY3Rpb24gX19yc2Vx
X2ZhaWx1cmUsIFwyMmF4XDIyXDBBXDA5LmJ5dGUgMHgwZiwgMHhiOSwgMHgzZFwwQVwwOS5sb25n
IDB4NTMwNTMwNTNcMEFcMDk0OlwwQVwwOWptcCAkezY6bH1cMEFcMDkucG9wc2VjdGlvblwwQVww
OSIsICJyLHIsKm0scixlciwqbSxpLGksfnttZW1vcnl9LH57Y2N9LH57cmF4fSx+e3JieH0sfntk
aXJmbGFnfSx+e2Zwc3J9LH57ZmxhZ3N9IihpMzIgJTUsICVzdHJ1Y3QucnNlcSogJTQsIGk2NCog
JTYsIGk2NCAwLCBpNjQgOCwgaTY0KiBub25udWxsICUzLCBpOCogYmxvY2thZGRyZXNzKEB0aGlz
X2NwdV9saXN0X3BvcCwgJWNsZWFudXApLCBpOCogYmxvY2thZGRyZXNzKEB0aGlzX2NwdV9saXN0
X3BvcCwgJWNsZWFudXAudGhyZWFkMTkpKSAjNAogICAgICAgICAgdG8gbGFiZWwgJWlmLnRoZW4g
W2xhYmVsICVjbGVhbnVwLCBsYWJlbCAlY2xlYW51cC50aHJlYWQxOV0sICFzcmNsb2MgITgKCmNs
ZWFudXAudGhyZWFkMTk6ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOyBwcmVkcyA9
ICVmb3IuY29uZAogICU3ID0gYml0Y2FzdCAlc3RydWN0LnBlcmNwdV9saXN0X25vZGUqKiAlaGVh
ZCB0byBpOCoKICBjYWxsIHZvaWQgQGxsdm0ubGlmZXRpbWUuZW5kLnAwaTgoaTY0IDgsIGk4KiBu
b25udWxsICU3KSAjNAogIGJyIGxhYmVsICVyZXR1cm4KCmlmLnRoZW46ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgOyBwcmVkcyA9ICVmb3IuY29uZAogICUubGNzc2Eg
PSBwaGkgaTMyIFsgJTUsICVmb3IuY29uZCBdCiAgJTggPSBiaXRjYXN0ICVzdHJ1Y3QucGVyY3B1
X2xpc3Rfbm9kZSoqICVoZWFkIHRvIGk4KgogICV0b2Jvb2w2Lm5vdCA9IGljbXAgZXEgaTMyKiAl
X2NwdSwgbnVsbAogIGJyIGkxICV0b2Jvb2w2Lm5vdCwgbGFiZWwgJWNsZWFudXAudGhyZWFkLCBs
YWJlbCAlaWYudGhlbjcKCmlmLnRoZW43OiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgOyBwcmVkcyA9ICVpZi50aGVuCiAgc3RvcmUgaTMyICUubGNzc2EsIGkzMiogJV9j
cHUsIGFsaWduIDQsICF0YmFhICE0CiAgYnIgbGFiZWwgJWNsZWFudXAudGhyZWFkCgpjbGVhbnVw
LnRocmVhZDogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDsgcHJlZHMgPSAlaWYu
dGhlbiwgJWlmLnRoZW43CiAgJTkgPSBsb2FkICVzdHJ1Y3QucGVyY3B1X2xpc3Rfbm9kZSosICVz
dHJ1Y3QucGVyY3B1X2xpc3Rfbm9kZSoqICVoZWFkLCBhbGlnbiA4LCAhdGJhYSAhOQogIGNhbGwg
dm9pZCBAbGx2bS5saWZldGltZS5lbmQucDBpOChpNjQgOCwgaTgqIG5vbm51bGwgJTgpICM0CiAg
YnIgbGFiZWwgJXJldHVybgoKY2xlYW51cDogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICA7IHByZWRzID0gJWZvci5jb25kCiAgY2FsbCB2b2lkIEBsbHZtLmxpZmV0aW1l
LmVuZC5wMGk4KGk2NCA4LCBpOCogbm9ubnVsbCAlMCkgIzQKICBiciBsYWJlbCAlZm9yLmNvbmQK
CnJldHVybjogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOyBwcmVk
cyA9ICVjbGVhbnVwLnRocmVhZDE5LCAlY2xlYW51cC50aHJlYWQKICAlcmV0dmFsLjExOCA9IHBo
aSAlc3RydWN0LnBlcmNwdV9saXN0X25vZGUqIFsgJTksICVjbGVhbnVwLnRocmVhZCBdLCBbIG51
bGwsICVjbGVhbnVwLnRocmVhZDE5IF0KICByZXQgJXN0cnVjdC5wZXJjcHVfbGlzdF9ub2RlKiAl
cmV0dmFsLjExOAp9CioqKiBJUiBEdW1wIEFmdGVyIEdWTlBhc3Mgb24gdGhpc19jcHVfbGlzdF9w
b3AgKioqCjsgRnVuY3Rpb24gQXR0cnM6IG5vdW53aW5kIHV3dGFibGUKZGVmaW5lIGRzb19sb2Nh
bCAlc3RydWN0LnBlcmNwdV9saXN0X25vZGUqIEB0aGlzX2NwdV9saXN0X3BvcCglc3RydWN0LnBl
cmNwdV9saXN0KiAlbGlzdCwgaTMyKiB3cml0ZW9ubHkgJV9jcHUpIGxvY2FsX3VubmFtZWRfYWRk
ciAjMCB7CmVudHJ5OgogICVoZWFkID0gYWxsb2NhICVzdHJ1Y3QucGVyY3B1X2xpc3Rfbm9kZSos
IGFsaWduIDgKICAlMCA9IGJpdGNhc3QgJXN0cnVjdC5wZXJjcHVfbGlzdF9ub2RlKiogJWhlYWQg
dG8gaTgqCiAgJTEgPSB0YWlsIGNhbGwgaTgqIGFzbSAibW92ICVmczowLCAkMCIsICI9cix+e2Rp
cmZsYWd9LH57ZnBzcn0sfntmbGFnc30iKCkgIzMsICFzcmNsb2MgITMKICAlMiA9IGxvYWQgaTMy
LCBpMzIqIEByc2VxX29mZnNldCwgYWxpZ24gNCwgIXRiYWEgITQKICAlaWR4LmV4dC5pLmkxMSA9
IHNleHQgaTMyICUyIHRvIGk2NAogICVhZGQucHRyLmkuaTEyID0gZ2V0ZWxlbWVudHB0ciBpOCwg
aTgqICUxLCBpNjQgJWlkeC5leHQuaS5pMTEKICAlY3B1X2lkX3N0YXJ0LmkgPSBiaXRjYXN0IGk4
KiAlYWRkLnB0ci5pLmkxMiB0byBpMzIqCiAgJTMgPSBiaXRjYXN0ICVzdHJ1Y3QucGVyY3B1X2xp
c3Rfbm9kZSoqICVoZWFkIHRvIGk2NCoKICAlNCA9IGJpdGNhc3QgaTgqICVhZGQucHRyLmkuaTEy
IHRvICVzdHJ1Y3QucnNlcSoKICBiciBsYWJlbCAlZm9yLmNvbmQKCmZvci5jb25kOiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOyBwcmVkcyA9ICVjbGVhbnVwLCAlZW50
cnkKICBjYWxsIHZvaWQgQGxsdm0ubGlmZXRpbWUuc3RhcnQucDBpOChpNjQgOCwgaTgqIG5vbm51
bGwgJTApICM0CiAgJTUgPSBsb2FkIHZvbGF0aWxlIGkzMiwgaTMyKiAlY3B1X2lkX3N0YXJ0Lmks
IGFsaWduIDMyLCAhdGJhYSAhNAogICVpZHhwcm9tID0gc2V4dCBpMzIgJTUgdG8gaTY0CiAgJWhl
YWQxID0gZ2V0ZWxlbWVudHB0ciBpbmJvdW5kcyAlc3RydWN0LnBlcmNwdV9saXN0LCAlc3RydWN0
LnBlcmNwdV9saXN0KiAlbGlzdCwgaTY0IDAsIGkzMiAwLCBpNjQgJWlkeHByb20sIGkzMiAwCiAg
JTYgPSBiaXRjYXN0ICVzdHJ1Y3QucGVyY3B1X2xpc3Rfbm9kZSoqICVoZWFkMSB0byBpNjQqCiAg
Y2FsbGJyIHZvaWQgYXNtIHNpZGVlZmZlY3QgIi5wdXNoc2VjdGlvbiBfX3JzZXFfY3MsIFwyMmF3
XDIyXDBBXDA5LmJhbGlnbiAzMlwwQVwwOTM6XDBBXDA5LmxvbmcgMHgwLCAweDBcMEFcMDkucXVh
ZCAxZiwgKDJmIC0gMWYpLCA0ZlwwQVwwOS5wb3BzZWN0aW9uXDBBXDA5LnB1c2hzZWN0aW9uIF9f
cnNlcV9jc19wdHJfYXJyYXksIFwyMmF3XDIyXDBBXDA5LnF1YWQgM2JcMEFcMDkucG9wc2VjdGlv
blwwQVwwOS5wdXNoc2VjdGlvbiBfX3JzZXFfZXhpdF9wb2ludF9hcnJheSwgXDIyYXdcMjJcMEFc
MDkucXVhZCAxZiwgJHs3Omx9XDBBXDA5LnBvcHNlY3Rpb25cMEFcMDlsZWFxIDNiKCVyaXApLCAl
cmF4XDBBXDA5bW92cSAlcmF4LCA4KCQxKVwwQVwwOTE6XDBBXDA5Y21wbCAkMCwgNCgkMSlcMEFc
MDlqbnogNGZcMEFcMDltb3ZxICQyLCAlcmJ4XDBBXDA5Y21wcSAlcmJ4LCAkM1wwQVwwOWplICR7
NzpsfVwwQVwwOW1vdnEgJXJieCwgJDVcMEFcMDlhZGRxICQ0LCAlcmJ4XDBBXDA5bW92cSAoJXJi
eCksICVyYnhcMEFcMDl1ZDJcMEFcMDltb3ZxICVyYngsICQyXDBBXDA5MjpcMEFcMDkucHVzaHNl
Y3Rpb24gX19yc2VxX2ZhaWx1cmUsIFwyMmF4XDIyXDBBXDA5LmJ5dGUgMHgwZiwgMHhiOSwgMHgz
ZFwwQVwwOS5sb25nIDB4NTMwNTMwNTNcMEFcMDk0OlwwQVwwOWptcCAkezY6bH1cMEFcMDkucG9w
c2VjdGlvblwwQVwwOSIsICJyLHIsKm0scixlciwqbSxpLGksfnttZW1vcnl9LH57Y2N9LH57cmF4
fSx+e3JieH0sfntkaXJmbGFnfSx+e2Zwc3J9LH57ZmxhZ3N9IihpMzIgJTUsICVzdHJ1Y3QucnNl
cSogJTQsIGk2NCogJTYsIGk2NCAwLCBpNjQgOCwgaTY0KiBub25udWxsICUzLCBpOCogYmxvY2th
ZGRyZXNzKEB0aGlzX2NwdV9saXN0X3BvcCwgJWNsZWFudXApLCBpOCogYmxvY2thZGRyZXNzKEB0
aGlzX2NwdV9saXN0X3BvcCwgJWNsZWFudXAudGhyZWFkMTkpKSAjNAogICAgICAgICAgdG8gbGFi
ZWwgJWlmLnRoZW4gW2xhYmVsICVjbGVhbnVwLCBsYWJlbCAlY2xlYW51cC50aHJlYWQxOV0sICFz
cmNsb2MgITgKCmNsZWFudXAudGhyZWFkMTk6ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgOyBwcmVkcyA9ICVmb3IuY29uZAogIGNhbGwgdm9pZCBAbGx2bS5saWZldGltZS5lbmQucDBp
OChpNjQgOCwgaTgqIG5vbm51bGwgJTApICM0CiAgYnIgbGFiZWwgJXJldHVybgoKaWYudGhlbjog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA7IHByZWRzID0gJWZvci5j
b25kCiAgJXRvYm9vbDYubm90ID0gaWNtcCBlcSBpMzIqICVfY3B1LCBudWxsCiAgYnIgaTEgJXRv
Ym9vbDYubm90LCBsYWJlbCAlY2xlYW51cC50aHJlYWQsIGxhYmVsICVpZi50aGVuNwoKaWYudGhl
bjc6ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA7IHByZWRzID0gJWlm
LnRoZW4KICBzdG9yZSBpMzIgJTUsIGkzMiogJV9jcHUsIGFsaWduIDQsICF0YmFhICE0CiAgYnIg
bGFiZWwgJWNsZWFudXAudGhyZWFkCgpjbGVhbnVwLnRocmVhZDogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDsgcHJlZHMgPSAlaWYudGhlbiwgJWlmLnRoZW43CiAgY2FsbCB2b2lk
IEBsbHZtLmxpZmV0aW1lLmVuZC5wMGk4KGk2NCA4LCBpOCogbm9ubnVsbCAlMCkgIzQKICBiciBs
YWJlbCAlcmV0dXJuCgpjbGVhbnVwOiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDsgcHJlZHMgPSAlZm9yLmNvbmQKICBjYWxsIHZvaWQgQGxsdm0ubGlmZXRpbWUuZW5k
LnAwaTgoaTY0IDgsIGk4KiBub25udWxsICUwKSAjNAogIGJyIGxhYmVsICVmb3IuY29uZAoKcmV0
dXJuOiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA7IHByZWRzID0g
JWNsZWFudXAudGhyZWFkMTksICVjbGVhbnVwLnRocmVhZAogIHJldCAlc3RydWN0LnBlcmNwdV9s
aXN0X25vZGUqIG51bGwKfQo=
--000000000000de77da05d337f80c
Content-Type: application/octet-stream; name="reduced.ll"
Content-Disposition: attachment; filename="reduced.ll"
Content-Transfer-Encoding: base64
Content-ID: <f_kx86npne1>
X-Attachment-Id: f_kx86npne1

JXN0cnVjdC5wZXJjcHVfbGlzdF9ub2RlID0gdHlwZSB7IGk2NCwgJXN0cnVjdC5wZXJjcHVfbGlz
dF9ub2RlKiB9CgpkZWZpbmUgJXN0cnVjdC5wZXJjcHVfbGlzdF9ub2RlKiBAdGhpc19jcHVfbGlz
dF9wb3AoKSB7CiAgJWhlYWQgPSBhbGxvY2EgJXN0cnVjdC5wZXJjcHVfbGlzdF9ub2RlKiwgaTMy
IDAsIGFsaWduIDgKICBiciBsYWJlbCAlZm9yLmNvbmQKCmZvci5jb25kOgogIGNhbGxiciB2b2lk
IGFzbSBzaWRlZWZmZWN0ICIiLCAiaSxpIihpOCogYmxvY2thZGRyZXNzKEB0aGlzX2NwdV9saXN0
X3BvcCwgJWNsZWFudXApLCBpOCogYmxvY2thZGRyZXNzKEB0aGlzX2NwdV9saXN0X3BvcCwgJWNs
ZWFudXAudGhyZWFkMTkpKQogICAgICAgICAgdG8gbGFiZWwgJWNsZWFudXAudGhyZWFkIFtsYWJl
bCAlY2xlYW51cCwgbGFiZWwgJWNsZWFudXAudGhyZWFkMTldCgpjbGVhbnVwLnRocmVhZDoKICAl
eCA9IGxvYWQgJXN0cnVjdC5wZXJjcHVfbGlzdF9ub2RlKiwgJXN0cnVjdC5wZXJjcHVfbGlzdF9u
b2RlKiogJWhlYWQsIGFsaWduIDgKICBiciBsYWJlbCAlcmV0dXJuCgpjbGVhbnVwOgogIGJyIGxh
YmVsICVmb3IuY29uZAoKY2xlYW51cC50aHJlYWQxOToKICBiciBsYWJlbCAlcmV0dXJuCgpyZXR1
cm46ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDsgcHJlZHMgPSAl
Y2xlYW51cC50aHJlYWQsICVjbGVhbnVwLnRocmVhZDE5CiAgJXJldHZhbC4xMTggPSBwaGkgJXN0
cnVjdC5wZXJjcHVfbGlzdF9ub2RlKiBbICV4LCAlY2xlYW51cC50aHJlYWQgXSwgWyBudWxsLCAl
Y2xlYW51cC50aHJlYWQxOSBdCiAgcmV0ICVzdHJ1Y3QucGVyY3B1X2xpc3Rfbm9kZSogJXJldHZh
bC4xMTgKfQo=
--000000000000de77da05d337f80c--
