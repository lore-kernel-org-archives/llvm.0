Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FF42DCBF7
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758050365; cv=none; b=hNLmGgo1kbXqeN9I35oeBKKbZxmdyA7mJrNdbz8O/jIKcw67LmQq2qh7Hz5DQ2q8v1Sw0O0+UotJ90EPpB2xD3YkWQWQe4rMmqLashkgrBxPaY2NXtos9ZWy08dJnOXJkYa4ZjLE5CZO3TIKTTaPPRQv0/4tCHEkjlOc/2hLnA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758050365; c=relaxed/simple;
	bh=HTWTYQAOTHIjLwAzxlSDk16tb8/GXJ2kFlZLABMbnYk=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=uEypIeF7mhRJdfyNiyt3XXrCsLuj265hLI4+0HTG841MwTXZfUok3PJMXO8/xlzEwNy2IKvdp9tHFH3w5ecxTXz4p5tKAoS9qDOGCHVvfe1xvlSePLe9LC3XLprJcFOFlHVR76cYYvIXrd1Kwyf3nLJPph6Q1gFhln5BZxl3IKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VszCE04C; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VszCE04C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758050362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=j8m1JELKBW7ST9yN9higpb/0nnMgZ+tdjXUxJLHHgQc=;
	b=VszCE04C4X5r/13ye8V0n38Sg2viPR0QZMez8Logq1VVZfSarIonOdc5bHOQDkuvv27ViO
	Ka/N/w5FzFLtGXlk77ZI7GVJFOB9UZmI8F/kwFctiEnIvw6RIHNZcoMq0CSVQWFDvybMlr
	ohE91RZ4bieEnaOYvuoaDx7HCYFk7U4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-117-CspUtF-tO_id2GDoU5bm2Q-1; Tue,
 16 Sep 2025 15:19:21 -0400
X-MC-Unique: CspUtF-tO_id2GDoU5bm2Q-1
X-Mimecast-MFC-AGG-ID: CspUtF-tO_id2GDoU5bm2Q_1758050360
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A25AB1956077
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:19:20 +0000 (UTC)
Received: from [172.20.100.178] (unknown [10.30.44.68])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 256A730001A4;
	Tue, 16 Sep 2025 19:19:19 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.16.0-0,
 upstream-mainline, 186f3edf)
Date: Tue, 16 Sep 2025 19:19:19 -0000
To: bgoncalv@redhat.com, ftjahjad@redhat.com, yoyang@redhat.com,
 llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <03521.125091615192101759@us-mta-117.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N7JW8UBge5b_sHVH-bhNGrb4AXmxzTpu-LN4T2Q-t2Q_1758050360
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'pinctrl-v6.17-1' of git://git.kernel.org/pub=
/scm/linux/kernel/git/linusw/linux-pinctrl

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1962748323

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1962748323_x86_64_kernel-debug_kcidb_tool_19276341_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1962748323_x86_64_kernel-debug_kcidb_tool_19276341_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
        xfstests - nfsv4.2
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1962748323_x86_64_kernel_kcidb_tool_19276403_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/221
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1962748323_x86_64_kernel-debug_kcidb_tool_19276342_21
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

