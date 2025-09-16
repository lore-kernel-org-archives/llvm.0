Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5D8B661
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758050210; cv=none; b=Mycy/aRYjK3qfEmXYyHsZpYWnv2vTd4o73ol+5gsCpLBa1YMo8M+06z8f02bCxX/f6X1K6qH5oTjhGM/+lNaXrQjP93OLmVRo2Or2KC5+cnS+VJCbVUxGiuNUgDP5N7JaPuKKpKewQtxrGoqGzMn6j89CC8rA5/ZwmI3q0sLDn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758050210; c=relaxed/simple;
	bh=pS0cQzibVF//WkhFG5YwN0tNpuknptY9RS9yoFhfuBY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=eGbGe8nQS32cVzuBclIRnYD+mMZqF3qlasK3zZ5hQ3M7DXQjUee/PEnpZP8plY7kv26QffeeQ4hoOEASKMeTxYcJgsc4r0BQZzCPBcua+h4sUyYcpoXr46yhvenoEI1O/HZipr0NJSZUtzeBUaRqCPyNibPJklGWezGlTy4Qs9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MvlBnoUQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MvlBnoUQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758050206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NyUXRQUbUYUV6ZwOMDtzLd4ck6NSc/QtfZockWsYt7k=;
	b=MvlBnoUQTkrxKU1h0ypLWBelADj8koHJKIBCdMAQJpcZuMzCEHI/EPRpcX5haeLpnJeBV/
	0WWLtL7fown/A67xpvn+OJbsJl12RKnB0B7cddFq6f4WN++Yzp72e3A2UHOPtxXdH8eXgH
	gw5TCfeUx+aOY6GYO4uhJyVSYFXug+A=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-172-gWk4QGLTM-63VyP3vL3Ylg-1; Tue,
 16 Sep 2025 15:16:44 -0400
X-MC-Unique: gWk4QGLTM-63VyP3vL3Ylg-1
X-Mimecast-MFC-AGG-ID: gWk4QGLTM-63VyP3vL3Ylg_1758050203
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1EF27180057D
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:16:43 +0000 (UTC)
Received: from [172.20.100.178] (unknown [10.30.44.68])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A0F9F195608E;
	Tue, 16 Sep 2025 19:16:42 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 19 of 137): Test report for master
 (6.16.0-0, upstream-mainline, 561c8036)
Date: Tue, 16 Sep 2025 19:16:42 -0000
To: bgoncalv@redhat.com, ftjahjad@redhat.com, yoyang@redhat.com,
 llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <49324.125091615164400933@us-mta-172.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _TQqkQYP3owmwExd_je5pm97CbJEGpDF3sgzrNdgl00_1758050203
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'tty-6.16-rc1-2' of git://git.kernel.org/pub/=
scm/linux/kernel/git/gregkh/tty

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1975758782

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1975758782_x86_64_kernel-debug_kcidb_tool_19330754_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1975758782_x86_64_kernel-debug_kcidb_tool_19330754_12
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
        xfstests - nfsv4.2
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1975758782_x86_64_kernel_kcidb_tool_19330740_33
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/221
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1975758782_x86_64_kernel-debug_kcidb_tool_19330754_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/221

    We also see the following known issues which are not related to your ch=
anges:
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]
        Issue: [net] [kselftests upstream] catch all failures
            URL: https://issues.redhat.com/browse/RHELTEST-1362
            Affected tests:
                kselftests upstream - bpf [x86_64, x86_64]
                kselftests upstream - bpf_test_progs [x86_64, x86_64]
                kselftests upstream - net [x86_64, x86_64]


Tests that were not ran because of internal issues:
    /distribution/check-install [s390x, x86_64]
    /distribution/command [s390x, x86_64]
    /test/misc/machineinfo [s390x, x86_64]
    Boot test [s390x, x86_64]
    CKI/restraint [s390x, x86_64]
    Reboot test [s390x, x86_64]
    SELinux Custom Module Setup [s390x, x86_64]
    selinux-policy: serge-testsuite [x86_64]
    Storage - blktests - throtl [s390x]
    Storage - blktests - ublk [s390x]
    stress: stress-ng - cpu-cache [s390x]
    stress: stress-ng - memory [s390x]


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

