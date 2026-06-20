Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5F740D582
	for <llvm@lists.linux.dev>; Sat, 20 Jun 2026 14:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781964133; cv=none; b=nOMne/v98fYt6f1xlt5PvCFYel28SXBgLY2vAYm54Ek3DgHl/rxIL9bICq20lxxWJdJ0jfwWf/Tf/L5ubZNxakhk0sEVPi2kFHfgl7H4AT3PEqHWOpBjIcsGz8YVR70udXgAej1CnrVcEMNvHq6XXFOztCQjVTf4UZE8fFC54YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781964133; c=relaxed/simple;
	bh=iloxMqGxzrtYQuQeILVv1Xyu6RtUyJy0XXBhj4AVXpA=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=VVlTEbm7YGg4NPdHewOQOJd3/zZfWAtckir6Z0toJBMkrbSuK5AoWd0iukrnvUe9V3FbvIJJkkJgPy0FjxcOuRT2MzBR2/lWLcaLKMYWxiTNCk1502YZirHqa25i9R5aaTGC4nDP4mNmwc1+NpkJkVCf4z8gpwZOcwWKvEDmyTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A4c2znJH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A4c2znJH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781964130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Rx76pbwGiJP1ujJ7C020helynIEk0Syv1gsaMrBd/yE=;
	b=A4c2znJHxrMT4YG+7eUHBQeWZLOF2GNxsjgJ8kTyRvFgqIRVxzvkHOTyg7Sdm0Qwa3z4J2
	4FP3+1m0ihTDrkLO6nu23KRZKzGbOWBo3/y7rXAlDV+5GJfw4kUp6E6jcWhoG33+l4o+UE
	gsDWzBY/G2kLrQO7ZZFRClwXHav6qn4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-601-b58c7AWMM_2JlJsgASyXPQ-1; Sat,
 20 Jun 2026 10:02:08 -0400
X-MC-Unique: b58c7AWMM_2JlJsgASyXPQ-1
X-Mimecast-MFC-AGG-ID: b58c7AWMM_2JlJsgASyXPQ_1781964127
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 73B9D180058D
	for <llvm@lists.linux.dev>; Sat, 20 Jun 2026 14:02:07 +0000 (UTC)
Received: from [172.20.103.220] (unknown [10.30.45.77])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C5A7130000DB;
	Sat, 20 Jun 2026 14:02:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-0,
 upstream-mainline, 5e2e1474)
Date: Sat, 20 Jun 2026 14:02:06 -0000
To: bgoncalv@redhat.com, ftjahjad@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <01946.126062010020800261@us-mta-601.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3hdhxGQ398fHv-7k3wAgHqAcSQYURqEdhxWPhuW0pq8_1781964127
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'landlock-7.2-rc1' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/mic/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2615246352

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2615246352_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2615246352_x86_64_kernel_kcidb_tool_21496141_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check

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

