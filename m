Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8968E43AB0
	for <llvm@lists.linux.dev>; Fri, 19 Jun 2026 13:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781875991; cv=none; b=sDK5Aw9dX3ey/y8Bw1PjuDSR/IZ1Gt9wV7dKp0Y2sR9BUbkHMLclmcGBO0jNc+7qwa9XNtKtM6Df+HOEQLF4nUMDWHOXozc9H7Nf+Mo9GDu27WyLnYl50sF2LQgt4mRE+p9WRWB3HH6XE3xGgl+gijw8sr1RjWGd+j+hIfu3114=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781875991; c=relaxed/simple;
	bh=aKHUAQPqIAhngtpyd/bHrm4Nl6o7RQ33aEItcdu2U9k=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=C6zok7Qu3wWRDBgTo2VmOEt+nF+H9YX1gjjsjuH56KHaicVm3fBcPv4unhfyJz3DtYaF5jlhOmI/miE/lgoZ5Aqx7ktmOx/qOW5qsiijxx99xFpipkxKuFsn8Mx3nQ0REEry/9uR9ee+uvcQPa0uZu1hZYHu+JQEqaYTD5Te8gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d/cIi665; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d/cIi665"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781875988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0aDLloeeGw6jAlLKP58ANZaSKwBqfm2kWSCsWLg7+iA=;
	b=d/cIi665H2+Y+pHZXxxCzKBvalR0YH8F6O7D2RSeHzRPebJX6FtcF5rrJ/G/BQFk7Gnz44
	issXZXc1GYrjDwoOWEvjWKR0yiUgaWK2efCMFeMbdO4cH4FpMW8CjhriOO8/u9mleiiGyx
	56b/02F4RDs6dU0mTxK5mu5TSi1cU50=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-125-UH6-yAMbM_ulAcZCZjb6VA-1; Fri,
 19 Jun 2026 09:33:07 -0400
X-MC-Unique: UH6-yAMbM_ulAcZCZjb6VA-1
X-Mimecast-MFC-AGG-ID: UH6-yAMbM_ulAcZCZjb6VA_1781875986
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 73AF61845436
	for <llvm@lists.linux.dev>; Fri, 19 Jun 2026 13:33:06 +0000 (UTC)
Received: from [172.20.107.180] (unknown [10.30.44.89])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CD6F71800361;
	Fri, 19 Jun 2026 13:33:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-0,
 upstream-mainline, 53c7db5c)
Date: Fri, 19 Jun 2026 13:33:05 -0000
To: bgoncalv@redhat.com, yoyang@redhat.com, llvm@lists.linux.dev,
 ftjahjad@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <89999.126061909330700417@us-mta-125.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: m8nLEJEKoiarqSMUsFSP8Pk40L4ndFdN7uSSoYhXUmo_1781875986
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'pinctrl-v7.2-1' of git://git.kernel.org/pub/=
scm/linux/kernel/git/linusw/linux-pinctrl

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2612995454

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2612995454_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2612995454_x86_64_kernel_kcidb_tool_21490682_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2612995454_x86_64_kernel_kcidb_tool_21490682_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2612995454_aarch64_kernel_kcidb_tool_21490680_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2612995454_x86_64_kernel_kcidb_tool_21490683_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301

    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc: denied { create } for comm=3D"rpc.mountd"
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2456368
            Affected tests:
                xfstests - nfsv4.2 [x86_64]



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

