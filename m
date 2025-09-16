Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91B02C11E3
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758050444; cv=none; b=Kj05uM+LuyAYHDOYPTtXe4urLTmiqzU9+CVyDEUUb7Lvm/2DvkBOyliX4ZL2q3ShWsCjRrm2QmVHehnzDhZIJTKDkEWBG3DRzNPOwSBC4KweMwhtxPvUTDbEfjgmaEV2ugKcSX7Hn/XYo8ObSyPZEED/b23fO08cwKYn2VzBkCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758050444; c=relaxed/simple;
	bh=0SmXO8Mj92RKnBTHhoDKsFBXXAByN+eksSZqH7je9nE=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Z1kItSYLJjwjRKhmvTVMgeGr0TQ31ZzS2k+me/5OwLesipDs8V8LrO9dmhE605S4B66vALN3ZOUJ21Z618aiFe0lwJdrfv7fmoZfe/TU6iFRAxAkVeGhZpIuQ1Rj6wUOZJW9ptwJ4eRPY3sxslppOyURJZaSty/V74s1fGHzC50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FuxrVvlg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FuxrVvlg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758050441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Pl8R15kXKKs+99gJvICNjPEaQMFWDeWQQptCKcdoZE0=;
	b=FuxrVvlgI5a6lhvTePSTosc3U+2kvKj5+iayXCQjfmJWfCxv5jHO3XxI9uHeDvF7lu3DKZ
	H4fPI6ECjUtPhngGAyaikKl0WPTfLZ8kRnC0QCal5yjQdtxV3QbUKPVvqfLqEDDHrDM2Ox
	ab0G8AgMgAWIzXnDdOdmdP2GXaINxkY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-312-eWWkQsGBNDqnQx_fTydR3A-1; Tue,
 16 Sep 2025 15:20:40 -0400
X-MC-Unique: eWWkQsGBNDqnQx_fTydR3A-1
X-Mimecast-MFC-AGG-ID: eWWkQsGBNDqnQx_fTydR3A_1758050438
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BD4D0195608C
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:20:38 +0000 (UTC)
Received: from [172.20.100.178] (unknown [10.30.44.68])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 351681800447;
	Tue, 16 Sep 2025 19:20:38 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 12 of 137): Test report for master
 (6.16.0-0, upstream-mainline, 6a68cec1)
Date: Tue, 16 Sep 2025 19:20:38 -0000
To: bgoncalv@redhat.com, ftjahjad@redhat.com, yoyang@redhat.com,
 llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <13475.125091615204001461@us-mta-312.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gD8PW43fh6I5hhcvfC9UJ0eL_G1W0vzpnOvNUB9gUsQ_1758050438
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'sched_ext-for-6.17' of git://git.kernel.org/=
pub/scm/linux/kernel/git/tj/sched_ext

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1960381251

One or more kernel tests failed:
    Unrecognized or new issues:
        Reboot test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1960381251_aarch64_kernel_kcidb_tool_19264062_11
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
        xfstests - nfsv4.2
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1960381251_x86_64_kernel_kcidb_tool_19264061_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/221

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [net] [kselftests upstream] catch all failures
            URL: https://issues.redhat.com/browse/RHELTEST-1362
            Affected tests:
                kselftests upstream - bpf [x86_64, x86_64]
                kselftests upstream - bpf_test_progs [x86_64, x86_64]
                kselftests upstream - net [x86_64, x86_64]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]


Tests that were not ran because of internal issues:
    /distribution/check-install [x86_64]
    /distribution/command [x86_64]
    /test/misc/machineinfo [x86_64]
    Boot test [x86_64]
    CKI/restraint [x86_64]
    Reboot test [x86_64]
    SELinux Custom Module Setup [x86_64]
    xfstests - btrfs [x86_64]
    xfstests - cifsv3.11 [x86_64]
    xfstests - ext4 [x86_64]
    xfstests - nfsv4.2 [x86_64]
    xfstests - xfs [x86_64]


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

