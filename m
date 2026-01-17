Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F8318E1F
	for <llvm@lists.linux.dev>; Sat, 17 Jan 2026 20:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768683194; cv=none; b=Ws1TmjOgc2165+XV7UfV48XmLhjWiXlE1vI9JmjKv4arUVIRuBirKE4ZwtRDf/athXkN79om8DKRtxj1LyzUmn2F7CBTmoPu35l77RAhB+oSm6/k5Ogz7rwgXzXzETtMsBEWCzhCWL2G89Xi4/V72P933/KCHYbOOt6yqolFKuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768683194; c=relaxed/simple;
	bh=IGW7o+VB5ZJcsFStEUtKp1ZvNiwAkF1owo9xR+ZXi7c=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=EZMeYzT/ohtO6KTtRl2P9xrZHxJYJRQO9b4F9ki5toUT9WeDeu83UyeMVN79uLUiHKPOY4YeJ1XvmpF2K0DXQa6bnGlNe+jyNzeUp4CfIY+t1gm8BYXDWJN3+93eNYngdwKBwlZD99dEHRd9+Cn/RcqHeCoAnQm2Bkuk9emuBiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H/DHEga6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H/DHEga6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768683192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oQlZC823JPf7YQUVTZDAO7Mr0B++q0V5IDkAMzgT7kE=;
	b=H/DHEga6NlrLy6TfJ75zOLZZZfRGXCzo4A+dXgZUimEOnf2GaOUO678cMuvAZRwUJXCziu
	X4POIlAOHIqGs0L1YwFDXHPSG27XzPwfOseBamSY0IFMSI1l0wdRuvUaGWWbqzDmr+OhDA
	ufCaNGjoDjWwMVGP5NXcu8r7L/y+Vpc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-659-Q6Z5LZRwNRG61jyZq_mNfg-1; Sat,
 17 Jan 2026 15:53:11 -0500
X-MC-Unique: Q6Z5LZRwNRG61jyZq_mNfg-1
X-Mimecast-MFC-AGG-ID: Q6Z5LZRwNRG61jyZq_mNfg_1768683190
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 28C3E1800447
	for <llvm@lists.linux.dev>; Sat, 17 Jan 2026 20:53:10 +0000 (UTC)
Received: from [172.20.95.168] (unknown [10.30.44.183])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BFAD519560A7;
	Sat, 17 Jan 2026 20:53:09 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 81 of 110): Test report for master
 (6.19.0-rc5, upstream-mainline, b62ce254)
Date: Sat, 17 Jan 2026 20:53:09 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <72761.126011715531100268@us-mta-659.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pzFhA6XIs1tKFAoshHPY7lOJ_Whn4gVGsaHwVhnoomo_1768683190
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'pm-6.19-rc6' of git://git.kernel.org/pub/scm=
/linux/kernel/git/rafael/linux-pm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2268001349

One or more kernel builds failed:
    Builds that are failing to boot:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:2268001349_x86_64_kernel-debug

Tests that were not ran because of internal issues:
    /distribution/check-install [aarch64, ppc64le, x86_64]
    /distribution/command [aarch64, ppc64le, x86_64]
    /test/misc/machineinfo [aarch64, ppc64le, x86_64]
    Boot test [aarch64, ppc64le, x86_64]
    CKI/restraint [aarch64, ppc64le, x86_64]
    kselftests upstream - bpf [x86_64]
    kselftests upstream - bpf_test_progs [x86_64]
    kselftests upstream - net [x86_64]
    Reboot test [aarch64, ppc64le, x86_64]
    SELinux Custom Module Setup [aarch64, ppc64le, x86_64]
    selinux-policy: serge-testsuite [aarch64, ppc64le, x86_64]
    Storage - blktests - throtl [aarch64, x86_64]
    Storage - blktests - ublk [aarch64, x86_64]
    stress: stress-ng - cpu-cache [aarch64, x86_64]
    stress: stress-ng - memory [aarch64, x86_64]
    xfstests - btrfs [aarch64, x86_64]
    xfstests - cifsv3.11 [x86_64]
    xfstests - ext4 [aarch64, x86_64]
    xfstests - nfsv4.2 [x86_64]
    xfstests - xfs [aarch64, x86_64]


If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___

