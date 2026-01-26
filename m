Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24472288CA3
	for <llvm@lists.linux.dev>; Mon, 26 Jan 2026 04:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769402532; cv=none; b=hiCUE8eFSfZuuBe0rxcU6bGaJJ1jLpU9++NJC9HjWXGd0cCAvp2yHJHOJKdS4yx7+Lh8wduRxF1ww3dO9lwk02DSvrtk0TAAgw6/HXKwdokGzgu1Uj2vuwqrvFVlMG3jrf7HA58qJDs3aba0udkb3LbNS1wma5QvOQ2xDPpvbi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769402532; c=relaxed/simple;
	bh=4mdamAeAgEhiilIQNYwViTKsOIL90RWgetkdoQNFoTI=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=ddQN7jWmQ3JomY6RMFD3j9yGID26EbVYS5UwmFgiKqjZVL6wTIb0z7FgSBk0Duwqn6MqxZOj0Y+ApJzzIT3txQQ0+uJTFU1XH6UgXwE0d9xauenpqFhCh2m8iVfsI3xkL8KCgCwlgbyPpN98MIXoYHYUYUkZs0vBGa3OA0vmmYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MOASkIwX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MOASkIwX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769402530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SvfCDRrdvSh9q+mhYKesVppTxOkskEBL4QmILGxveIE=;
	b=MOASkIwXGbctbtbOKHJTD+EaOIGq2vU4I+j7HHBQwIyq1JDlSy++BZhE3hxFjBbEQAjJMy
	5HPlUpc0c1of/2chaI1oRkVwdQg8Am7KHD6URK8JICcwYkotbMG8hiIwrU3H5R3mKGEinb
	7LjsONZBzJIwgRHzzbz6owdBGTgUQwQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-250-nCgSma7FM9G5nwnRDmk2PA-1; Sun,
 25 Jan 2026 23:42:07 -0500
X-MC-Unique: nCgSma7FM9G5nwnRDmk2PA-1
X-Mimecast-MFC-AGG-ID: nCgSma7FM9G5nwnRDmk2PA_1769402527
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E908D1956089
	for <llvm@lists.linux.dev>; Mon, 26 Jan 2026 04:42:06 +0000 (UTC)
Received: from [172.20.12.215] (unknown [10.30.44.139])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3DDAD19560B4;
	Mon, 26 Jan 2026 04:42:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 77 of 137): Test report for master
 (6.19.0-rc6, upstream-mainline, 0a6dce0a)
Date: Mon, 26 Jan 2026 04:42:06 -0000
To: yoyang@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <41889.126012523420700441@us-mta-250.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5b--m36y75dhv2qZWawdH96w9LAP8jiYGqMMkTlTcx0_1769402527
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'char-misc-6.19-rc7' of git://git.kernel.org/=
pub/scm/linux/kernel/git/gregkh/char-misc

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2285267539

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - nfsv4.2
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2285267539_x86_64_kernel_kcidb_tool_20523267_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/309
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2285267539_x86_64_kernel-debug_kcidb_tool_20523017_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/309


Tests that were not ran because of internal issues:
    /distribution/check-install [aarch64, ppc64le, s390x, x86_64]
    /distribution/command [aarch64, ppc64le, s390x, x86_64]
    /test/misc/machineinfo [aarch64, ppc64le, s390x, x86_64]
    Boot test [aarch64, ppc64le, s390x, x86_64]
    CKI/restraint [aarch64, ppc64le, s390x, x86_64]
    kselftests upstream - bpf [x86_64]
    kselftests upstream - bpf_test_progs [x86_64]
    kselftests upstream - net [x86_64]
    Reboot test [aarch64, ppc64le, s390x, x86_64]
    SELinux Custom Module Setup [aarch64, ppc64le, s390x, x86_64]
    selinux-policy: serge-testsuite [aarch64, ppc64le, s390x]
    Storage - blktests - throtl [s390x, x86_64]
    Storage - blktests - ublk [s390x, x86_64]
    stress: stress-ng - cpu-cache [s390x, x86_64]
    stress: stress-ng - memory [s390x, x86_64]
    xfstests - btrfs [aarch64]
    xfstests - ext4 [aarch64]
    xfstests - xfs [aarch64]


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

