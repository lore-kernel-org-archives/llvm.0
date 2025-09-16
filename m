Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934E823BCFD
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758050092; cv=none; b=GYCMuY5H7QJnVYqI+oUlPeCZlytp/zzXvgdXaI3sanTnv1HQafbY0pPBs+aclN7U7tBMCt7GZLKNBlAgJgUrNiMADqh9/ytd9WECerHJUPu7zFIDWDEC7XTiA/vqmhZ0askCfkHJj1VhaIEtVsR00C8YteGMkey4vx6x6Fnawqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758050092; c=relaxed/simple;
	bh=uQJfke9U/caB8o7GTniKqS9RgGkgz1SgnROIhk84xNw=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=RTGrGR6o0AOPjhnwWiR6+GNMMM3moGYPe4zD1tXWFvBRn0YEwqiDWaZYeKiEau3T6CfzyNxhI8I8TuWFST5T8w7DLSnZXCkUzL2wRXR25HYccZow2RaGTSXi5zPeylENBTLfuC0OPRRBWjofqJRh3WIAhiB3xmAdJaDtI9I2nXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VpCghmG9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VpCghmG9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758050089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2/RG8MQnMndjhOKEvYmvssFH1hMr5Ps8jGp+Bswc5w8=;
	b=VpCghmG9AoIoA619ixUd8XDcjb3YF1bYsGfEJ9/E/x97Q4qDGnoMKcrjSl0k6jPgl9/l//
	1I7rp8RX1n1vci4p5hJ5aJHMKM+cAaZZz9zFzHdbl9c6Rg8Aia00W3WIHDzTONYf6e4R3t
	nNQZjfvUEnA7011R0wGkT8708c1fzwg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-278-aVyOR63zMjqEcaNi5_iICA-1; Tue,
 16 Sep 2025 15:14:48 -0400
X-MC-Unique: aVyOR63zMjqEcaNi5_iICA-1
X-Mimecast-MFC-AGG-ID: aVyOR63zMjqEcaNi5_iICA_1758050087
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0BDA61800286
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:14:47 +0000 (UTC)
Received: from [172.20.100.178] (unknown [10.30.44.68])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 71A7630001A4;
	Tue, 16 Sep 2025 19:14:46 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 11 of 137): Test report for master
 (6.17.0-rc1, upstream-mainline, 0cc53520)
Date: Tue, 16 Sep 2025 19:14:46 -0000
To: yoyang@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <40211.125091615144800629@us-mta-278.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: y0TuZKqzwmM55iSiorsmLTqOEooWJEUnwst4wHY3fgM_1758050087
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'probes-fixes-v6.17-rc1' of git://git.kernel.=
org/pub/scm/linux/kernel/git/trace/linux-trace

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1983396293

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - nfsv4.2
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1983396293_x86_64_kernel_kcidb_tool_19360487_42
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/221
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1983396293_x86_64_kernel-debug_kcidb_tool_19360670_10
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
    /distribution/check-install [s390x]
    /distribution/command [s390x]
    /test/misc/machineinfo [s390x]
    Boot test [s390x]
    CKI/restraint [s390x]
    Reboot test [s390x]
    SELinux Custom Module Setup [s390x]
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

