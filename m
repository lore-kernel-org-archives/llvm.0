Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC21312D1F1
	for <llvm@lists.linux.dev>; Mon,  4 May 2026 02:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777863132; cv=none; b=QmV/XfDgdhfKvSQhgXHMl8lgkJYM/SBCT0Cl0jyXbfOd5IveUopV79U/9vzVxQZch3qxO5s1bnLxv6u3LyUAP9L+vJFycRQghmmTWeShP6Ipq0BUkBPkg7HGc7KylYtT1MJK1pOo5sTSjL3ColKPqj3GENfVYVCX9Tf8W1FufMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777863132; c=relaxed/simple;
	bh=xUqvQXeDtXj/0dgf/2Hw4Sa+u5SVksGb9VunGkzmNtk=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=cz9RLZjbhj5q6ZomtiJECBZvI6FVzjoSLcJFjbTSj8NsM0he0ToIhVfsyb8rXYdE0dBmifIaRfJnnZKC8Sa58CiduqQcQqPiKJnrtb+cWpOy4nsO4Ni2FyiUo8/zbEZBZXzMpZHbRaj7DF5/Eae3Ds+mvaT51aMr9jZ/8WQ6TUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UmhwkMEl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UmhwkMEl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777863129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=52ujGAQZ6lOOhCwBmiY6nTHDOovc5AgepAaIA3XdwW8=;
	b=UmhwkMElmghx/M/bFoM8hzFDIFQEC8CRGJJIuTq7hnlcF4GP0ujvD9GSwFZNr9DQS0d22W
	C1fSMTePsvTQ52E3MzX00sccsa859yvYDVksFbdG8WIYUI/xMr5LmrSlKvjMifoht5kUp9
	AD4yzEqgQR6FKrB03Z8EDn7yj+FcX3A=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-650-dLephNwzOvijc24nhgSKlQ-1; Sun,
 03 May 2026 22:52:07 -0400
X-MC-Unique: dLephNwzOvijc24nhgSKlQ-1
X-Mimecast-MFC-AGG-ID: dLephNwzOvijc24nhgSKlQ_1777863127
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EAE6A1800473
	for <llvm@lists.linux.dev>; Mon,  4 May 2026 02:52:06 +0000 (UTC)
Received: from [172.20.231.189] (unknown [10.30.44.222])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5FE9630001A1;
	Mon,  4 May 2026 02:52:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 68 of 97): Test report for master
 (7.1.0-rc1, upstream-mainline, f1a5e78a)
Date: Mon, 04 May 2026 02:52:06 -0000
To: llvm@lists.linux.dev, yoyang@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <67493.126050322520800150@us-mta-650.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wUVkH7SvpL383yrk_bJVSxFIdOBq6DRFfPLIbsKArIE_1777863127
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'drm-fixes-2026-05-02' of https://gitlab.free=
desktop.org/drm/kernel

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2494513254

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2494513254_x86_64_kernel_kcidb_tool_21210738_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301

    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: avc: denied { create } for comm=3D"rpc.mountd"
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2456368
            Affected tests:
                xfstests - nfsv4.2 [x86_64]


Tests that were not ran because of internal issues:
    /distribution/check-install [aarch64, ppc64le, s390x, x86_64]
    /distribution/command [aarch64, ppc64le, s390x, x86_64]
    /test/misc/machineinfo [aarch64, ppc64le, s390x, x86_64]
    Boot test [aarch64, ppc64le, s390x, x86_64]
    CKI/restraint [aarch64, ppc64le, s390x, x86_64]
    Reboot test [aarch64, ppc64le, s390x, x86_64]
    SELinux Custom Module Setup [aarch64, ppc64le, s390x, x86_64]
    selinux-policy: serge-testsuite [aarch64, ppc64le, s390x]
    Storage - blktests - throtl [aarch64, s390x, x86_64]
    Storage - blktests - ublk [aarch64, s390x, x86_64]
    stress: stress-ng - cpu-cache [aarch64, s390x, x86_64]
    stress: stress-ng - memory [aarch64, s390x, x86_64]
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

