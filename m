Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE163210184
	for <llvm@lists.linux.dev>; Wed, 12 Feb 2025 14:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739370569; cv=none; b=j9P5sHEF9feFpewJYG6KBrGnqKdiQfdlw5MsI6bI8eKZ8XPTPVq+AvfCpOR3Lutn44k54A1p0nPY6Wn5/szl1yqDnMlSFqvH5QRIQbmq/5TjQXtkOnME/gMVXcPsVnnROiVdIft62sCCElcmBiKik3rou17LrLpxfSmb0G2biH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739370569; c=relaxed/simple;
	bh=OPY/ttXempJru6Ga1RV4xoldFBk00fifGauRa8nVjwg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=sxM/mzzOOAgpU4XOOexrZUrpG75T+sB5zWCOwxfmkwrHdZ0ywplv09RxtT65fhVRfLp1tBoZHmRav4T7MPyKupXVP6lRibqtCRB/8x0qMKC4sys9eR57iJnSDAgkrQmag0GQ0ouJOxAfxxd1o7oBjuJwgzgAN5Q/OmOZLFUIiw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aauzvv+T; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aauzvv+T"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-868e368ec74so103387241.1
        for <llvm@lists.linux.dev>; Wed, 12 Feb 2025 06:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739370566; x=1739975366; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IQXDe8fhhmSLuPbo2aVFP4x2A1nmLJfbRBStCyLpsCw=;
        b=aauzvv+TninE927FTmj4T3iG6nQ1MpLOF0P/zke5+aUnxlvEpxolcZr8ZaVoKPYQwe
         bEcVyNchGyclzOvCQAQ26bQHGWv4VryObqHho16UXjGskHb8E/BWNZT3WL6wrRNnpFx9
         v8nhaTDaFypVNax/dj2BpM8Nwtik44jphqjigPxf1yOiYMiTn+TEg1sMWsRiUHluw3ts
         M7KMYH6ikyuPpijTAUWWwaa8gR9zyQV0KvK9kTvNcFMe3tL+Yrz5i+yhrjQ6UAIjP8lU
         FiN96qBs3yn/3kDdJSuXdObyU1jABw9229xZUQ7KYbeuylMWy8bHMTHsbWVUtmv9iN91
         qRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739370566; x=1739975366;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IQXDe8fhhmSLuPbo2aVFP4x2A1nmLJfbRBStCyLpsCw=;
        b=eNBc4oM2a087k0n6jgY5pXaFDyHBU6LE8RIshSYxVc4X+0uHxuy5PeWhIkNyKc7FlV
         ZJCn8h9NYGt3OsglQI6K49Wj+CcXSRdDmnaqrSISfz0C9DxtiULDKw1O6Yam/4NZCITJ
         Z1JkCsWeE9liTE+f3IPaAjpd9SfQj5Dt6cL39/5EzxiXDVL/8oc3Z56VUaJPXvIpCz1v
         EO1BRfQOKulPSqm//9jdJmXLFJ85rTcQMbXCZQaipd3XYdIBgBsVnm0PhF2tZTUs23So
         P1Zzs8mYhASAtLuxgYcZvam4ZpJMq2l7RDSF2ye9uOwUcNQraE2NLOwz8KjXp6ghwG6s
         2hTg==
X-Gm-Message-State: AOJu0Yy6BOTLQ7RmqerAcqH2pOBpP67a2tytLdFcAXk9k7+82zlv1OGm
	ULyN6eqH2K4BtPjBz4YkI87fD9wpmyib55uYc3mrqQ9KjgA3Y2udO5mjeMlPVYlb/bwr4oKAEkh
	WHAy190uHBY1z3kERCqmX008up4rIWcBqxC+JCFfTPEK+KIKs2aY=
X-Gm-Gg: ASbGncsO0/Ek3tcTmQhMl5UvIfGJ1lTGjv6lNmAdaSQKXVuHPF4cdkBAMkSxcJfai5j
	24QAo+hvIKdvYa3upDBNtuxW6hTdrWU0MPfsm8ufRcNHmBrxoMzWDpZK817zvy616oVvp8sNxpr
	M=
X-Google-Smtp-Source: AGHT+IG4n0xqcfXhx3NvshSoCQo+PEUb+p7MDHm4sjc30wvs2Pt/IPzEMlAVsG0PTmhHo4D+KJWvgxKySnM4I46+mqM=
X-Received: by 2002:a05:6122:16a2:b0:520:6773:e5ba with SMTP id
 71dfb90a1353d-52067b2abdemr3019034e0c.2.1739370565848; Wed, 12 Feb 2025
 06:29:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 12 Feb 2025 19:59:14 +0530
X-Gm-Features: AWEUYZkKLpdZkyHVsSB2BWfSoOZsdInFc-eqp2yhtj3-lDliB8rWq5u4wrqEWBc
Message-ID: <CA+G9fYuw3XJ3NcYGHT=Jt9mQP_si49GQNEa6sSNLeqDm9A6+Cw@mail.gmail.com>
Subject: selftest/vDSO: vdso_test_abi tests with gcc-13 and pass with clang-19
To: clang-built-linux <llvm@lists.linux.dev>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Shuah Khan <shuah@kernel.org>
Content-Type: multipart/mixed; boundary="000000000000b60a9b062df2c4e6"

--000000000000b60a9b062df2c4e6
Content-Type: text/plain; charset="UTF-8"

The kselftest-vDSO/vdso_test_abi test encounters failures when built
and executed using GCC-13 on armv7 architecture.
The issue has been observed on both TI X15 devices and QEMU-armv7.

Interestingly, the same test passes without any issues when built using
Clang-19.This failure is specific to GCC-13. but test case should have
been failed on clang toolchain but it did not.

The Clang toolchain likely defaults to the traditional 32-bit time_t on
32-bit Debian Trixie (except x86), leading to an ABI issue similar to
older compilers. This is affecting compatibility.

This is not a new regression,
this report generated on Linux next but also seen on Linux stable tree.

Test name: kselftest-vDSO/vdso_test_abi
Fails: gcc-13
pass: clang-19

Arnd Bergmann investigated and proposed a patch which fixes the problem.

Test regression: selftest-vDSO/vdso_test_abi:

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

# selftests: vDSO: vdso_test_abi
# TAP version 13
# 1..16
# # [vDSO kselftest] VDSO_VERSION: LINUX_2.6
# # The time is 184285885525887.-5268386858514840748
# ok 1 __vdso_gettimeofday
# # clock_id: CLOCK_REALTIME
# # The time is 184287230099877759.-1225334784
# ok 2 __vdso_clock_gettime CLOCK_REALTIME
# # The vdso resolution is 4294967296 -1225335584
# # The syscall resolution is 4294967296 -1225334784
# not ok 3 __vdso_clock_getres CLOCK_REALTIME
# # clock_id: CLOCK_BOOTTIME
# # The time is 3253049749439251215.-1225334784
# ok 4 __vdso_clock_gettime CLOCK_BOOTTIME
# # The vdso resolution is 4294967296 -1225335584
# # The syscall resolution is 4294967296 -1225334784
# not ok 5 __vdso_clock_getres CLOCK_BOOTTIME
# # clock_id: CLOCK_TAI
# # The time is 184549377723756415.-1225334784
# ok 6 __vdso_clock_gettime CLOCK_TAI
# # The vdso resolution is 4294967296 -1225335584
# # The syscall resolution is 4294967296 -1225334784
# not ok 7 __vdso_clock_getres CLOCK_TAI
# # clock_id: CLOCK_REALTIME_COARSE
# # The time is 128974845965660031.-1225334784
# ok 8 __vdso_clock_gettime CLOCK_REALTIME_COARSE
# # The vdso resolution is 42949672960000000 -1225335584
# # The syscall resolution is 42949672960000000 -1225334784
# not ok 9 __vdso_clock_getres CLOCK_REALTIME_COARSE
# # clock_id: CLOCK_MONOTONIC
# # The time is 3253311892768162575.-1225334784
# ok 10 __vdso_clock_gettime CLOCK_MONOTONIC
# # The vdso resolution is 4294967296 -1225335584
# # The syscall resolution is 4294967296 -1225334784
# not ok 11 __vdso_clock_getres CLOCK_MONOTONIC
# # clock_id: CLOCK_MONOTONIC_RAW
# # The time is 3253442966580101903.-1225334784
# ok 12 __vdso_clock_gettime CLOCK_MONOTONIC_RAW
# # The vdso resolution is 4294967296 -1225335584
# # The syscall resolution is 4294967296 -1225334784
# not ok 13 __vdso_clock_getres CLOCK_MONOTONIC_RAW
# # clock_id: CLOCK_MONOTONIC_COARSE
# # The time is 3197606291493094159.-1225334784
# ok 14 __vdso_clock_gettime CLOCK_MONOTONIC_COARSE
# # The vdso resolution is 42949672960000000 -1225335584
# # The syscall resolution is 42949672960000000 -1225334784
# not ok 15 __vdso_clock_getres CLOCK_MONOTONIC_COARSE
# # Couldn't find __vdso_time
# ok 16 # SKIP __vdso_time
# # 1 skipped test(s) detected. Consider enabling relevant config
options to improve coverage.
# # Totals: pass:8 fail:7 xfail:0 xpass:0 skip:1 error:0
not ok 3 selftests: vDSO: vdso_test_abi # exit=1

## Build
* test log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241126/testrun/26062838/suite/kselftest-vDSO/test/vDSO_vdso_test_abi/log
* TI x15 test log:
https://lkft.validation.linaro.org/scheduler/job/8117196#L7091
* build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2spp0E2mMNQq16RHsbzLSFAlxuM/

## Source
* git tree: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
* git sha: df5d6180169ae06a2eac57e33b077ad6f6252440 (this not new issue)
* architectures: armv7
* toolchain: gcc-13 (13.3.0) - failed
* toolchain: clang ( version: 19.1.7) - pass
* devices: Armv7 TI beaglebone, qemu-armv7

--
Linaro LKFT
https://lkft.linaro.org

--000000000000b60a9b062df2c4e6
Content-Type: application/x-patch; 
	name="0001-selftests-vdso-debug-vdso_test_abi-__kernel_old_time.patch"
Content-Disposition: attachment; 
	filename="0001-selftests-vdso-debug-vdso_test_abi-__kernel_old_time.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m6z27dxf0>
X-Attachment-Id: f_m6z27dxf0

ZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3ZEU08vdmRzb190ZXN0X2FiaS5j
IGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvdkRTTy92ZHNvX3Rlc3RfYWJpLmMKaW5kZXggYTU0
NDI0ZTIzMzZmNC4uMjU3NzhhN2Y4NDljZSAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvdkRTTy92ZHNvX3Rlc3RfYWJpLmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
dkRTTy92ZHNvX3Rlc3RfYWJpLmMKQEAgLTE3LDYgKzE3LDcgQEAKICNkZWZpbmUgX0dOVV9TT1VS
Q0UKICNpbmNsdWRlIDx1bmlzdGQuaD4KICNpbmNsdWRlIDxzeXMvc3lzY2FsbC5oPgorI2luY2x1
ZGUgPGxpbnV4L3RpbWVfdHlwZXMuaD4KIAogI2luY2x1ZGUgIi4uL2tzZWxmdGVzdC5oIgogI2lu
Y2x1ZGUgInZkc29fY29uZmlnLmgiCkBAIC0yNiw5ICsyNyw5IEBACiBzdGF0aWMgY29uc3QgY2hh
ciAqdmVyc2lvbjsKIHN0YXRpYyBjb25zdCBjaGFyICoqbmFtZTsKIAotdHlwZWRlZiBsb25nICgq
dmRzb19nZXR0aW1lb2ZkYXlfdCkoc3RydWN0IHRpbWV2YWwgKnR2LCBzdHJ1Y3QgdGltZXpvbmUg
KnR6KTsKLXR5cGVkZWYgbG9uZyAoKnZkc29fY2xvY2tfZ2V0dGltZV90KShjbG9ja2lkX3QgY2xr
X2lkLCBzdHJ1Y3QgdGltZXNwZWMgKnRzKTsKLXR5cGVkZWYgbG9uZyAoKnZkc29fY2xvY2tfZ2V0
cmVzX3QpKGNsb2NraWRfdCBjbGtfaWQsIHN0cnVjdCB0aW1lc3BlYyAqdHMpOwordHlwZWRlZiBs
b25nICgqdmRzb19nZXR0aW1lb2ZkYXlfdCkoc3RydWN0IF9fa2VybmVsX29sZF90aW1ldmFsICp0
diwgc3RydWN0IHRpbWV6b25lICp0eik7Cit0eXBlZGVmIGxvbmcgKCp2ZHNvX2Nsb2NrX2dldHRp
bWVfdCkoY2xvY2tpZF90IGNsa19pZCwgc3RydWN0IF9fa2VybmVsX29sZF90aW1lc3BlYyAqdHMp
OwordHlwZWRlZiBsb25nICgqdmRzb19jbG9ja19nZXRyZXNfdCkoY2xvY2tpZF90IGNsa19pZCwg
c3RydWN0IF9fa2VybmVsX29sZF90aW1lc3BlYyAqdHMpOwogdHlwZWRlZiB0aW1lX3QgKCp2ZHNv
X3RpbWVfdCkodGltZV90ICp0KTsKIAogY29uc3QgY2hhciAqdmRzb19jbG9ja19uYW1lWzEyXSA9
IHsKQEAgLTgzLDcgKzg0LDcgQEAgc3RhdGljIHZvaWQgdmRzb190ZXN0X2Nsb2NrX2dldHRpbWUo
Y2xvY2tpZF90IGNsa19pZCkKIAkJcmV0dXJuOwogCX0KIAotCXN0cnVjdCB0aW1lc3BlYyB0czsK
KwlzdHJ1Y3QgX19rZXJuZWxfb2xkX3RpbWVzcGVjIHRzOwogCWxvbmcgcmV0ID0gVkRTT19DQUxM
KHZkc29fY2xvY2tfZ2V0dGltZSwgMiwgY2xrX2lkLCAmdHMpOwogCiAJaWYgKHJldCA9PSAwKSB7
CkBAIC0xMzUsNyArMTM2LDcgQEAgc3RhdGljIHZvaWQgdmRzb190ZXN0X2Nsb2NrX2dldHJlcyhj
bG9ja2lkX3QgY2xrX2lkKQogCQlyZXR1cm47CiAJfQogCi0Jc3RydWN0IHRpbWVzcGVjIHRzLCBz
eXNfdHM7CisJc3RydWN0IF9fa2VybmVsX29sZF90aW1lc3BlYyB0cywgc3lzX3RzOwogCWxvbmcg
cmV0ID0gVkRTT19DQUxMKHZkc29fY2xvY2tfZ2V0cmVzLCAyLCBjbGtfaWQsICZ0cyk7CiAKIAlp
ZiAocmV0ID09IDApIHsKLS0gCjIuNDMuMAoK
--000000000000b60a9b062df2c4e6--
