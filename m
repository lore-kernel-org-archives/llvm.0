Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B270F3C2B8D
	for <llvm@lists.linux.dev>; Sun, 14 Jun 2026 13:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781443991; cv=none; b=mk4KnCMVa59IV79N/9oP90+pvPqDAieMNBXVp4Gr3JvF7KB6PZzqODrjfMLISjCaMVPwdgNaPr11Y6toBso3luG/D8QAVw9yJfOe5nFTmCKB/BtLj2Zyj1u0II7Ud6bmEIBF24E3aoK7YI4mTbOSN+weC3saGXO7YaihGrZzvIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781443991; c=relaxed/simple;
	bh=D+HHkQznhoPJw2tniBQuJK8FzBurvH1t3ZYE0J/vbLk=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=lGS7UtKtvP3KiqAw6GZ7EvvnAFen8vl0xiQ3SZbRJ3SU9Ls2llgQdyknDfgmz+J+eL483qvPqtDkdYMwZHnFNbMWthAZ5tTnUvErZ3/e290IOHIMBG7lFa6/b7NmvKpY67HXOtECu28jRkqDxN345J4ri6dN8iOJvbqynH5wqK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OX+d1kbN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OX+d1kbN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781443989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SHUSo7N1zcjhF9zsgYZM4hDyDn6e7rfuDH8Df200mh8=;
	b=OX+d1kbNxfCUMW+3oybE9Chr/HY6KNTmjI3jv43UX3eywapygajQNgDrJ64Zc+Rf7VpX8q
	GDCgS4bLH8m1RgVV6uIH9J/eZNbL4hzJqzmMGMm9tVZJyz7dKG/P7EIPNxYKjmAOE8PwAp
	YQ5G8pmhC1KGz8SKqn2H2egPehKKbaA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-421-yH43gnlmO5O4cDFH16G4yQ-1; Sun,
 14 Jun 2026 09:33:05 -0400
X-MC-Unique: yH43gnlmO5O4cDFH16G4yQ-1
X-Mimecast-MFC-AGG-ID: yH43gnlmO5O4cDFH16G4yQ_1781443985
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 010BE19560BB
	for <llvm@lists.linux.dev>; Sun, 14 Jun 2026 13:33:05 +0000 (UTC)
Received: from [172.20.201.113] (unknown [10.30.45.66])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7A4751800347;
	Sun, 14 Jun 2026 13:33:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-rc7,
 upstream-mainline, e21ee273)
Date: Sun, 14 Jun 2026 13:33:04 -0000
To: llvm@lists.linux.dev, yoyang@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <95722.126061409330600179@us-mta-421.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iVU-H0S2gxjMX6CqKJac6c2NO68BG55wTdCEhJWjDmo_1781443985
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'clk-fixes-for-linus' of git://git.kernel.org=
/pub/scm/linux/kernel/git/clk/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2599633709

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2599633709_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2599633709_x86_64_kernel_kcidb_tool_21462999_9
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

