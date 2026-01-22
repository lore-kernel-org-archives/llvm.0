Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C884F3542F0
	for <llvm@lists.linux.dev>; Thu, 22 Jan 2026 19:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769111001; cv=none; b=GnON4lGDLB7igxzHgI4TBPfZSNdc/W3sUI+g75O62jn3m19O7UUO8794Hn1LgxSWuNUvKBOmA22IT4pKw9YPMO8NaUqpoLoyYqFeWNbqNyy+K6VtjVBhfSiyVn/0vd5QBL2xVdxMK6eGaU9sFZKudmD4EcFrHIKKsU1vx0D7mgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769111001; c=relaxed/simple;
	bh=A9/gIPldbU/Ke+Px/r1XVtQtLUe19aunYqbi/9rAV6w=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=kMcsYwfEmNAxygbmAkcdst9viW8BWw+dQ1lWazOxy4gmauhLIzuDC73jYsi1oRQtkMai5ynCW0Dijcvisg2ZhC7HKRlCSqwpVfY6jbGljpyu7wF2pLK17VCyUdoHQxwbNQ1eIpBdwbY4SwpyGHo6ET4JoiNPLUYKSJMR3sezC0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=alserIUe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="alserIUe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769110988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=M95hJLm5PQYd7Gh0TDXgsHwNVqYIbuZ3/6f+F3XNmKQ=;
	b=alserIUerMmAjMFt4pKAO1il6+KUDrbZqSPld4SaU+FRLw3jUzhYDrJfHT/Qa5Sl2VsUWo
	5zfPuwR8jxvaYaggJPUqdG6YAVgSd9PNpGbRhKZDRBJ2UZX7QJhsIpKwZ4lGHY+cAubTWQ
	ZIf5U4/C7err5xPmNWA7I1T/2PKc8gY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-384-TOVuyCdyNA2Xx-5Ob7aWew-1; Thu,
 22 Jan 2026 14:43:07 -0500
X-MC-Unique: TOVuyCdyNA2Xx-5Ob7aWew-1
X-Mimecast-MFC-AGG-ID: TOVuyCdyNA2Xx-5Ob7aWew_1769110986
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6F24F1956089
	for <llvm@lists.linux.dev>; Thu, 22 Jan 2026 19:43:06 +0000 (UTC)
Received: from [172.20.12.215] (unknown [10.30.44.139])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AB6BD30002D8;
	Thu, 22 Jan 2026 19:43:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 61 of 137): Test report for master
 (6.19.0-rc6, upstream-mainline, cf38b234)
Date: Thu, 22 Jan 2026 19:43:05 -0000
To: ftjahjad@redhat.com, bgoncalv@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <71219.126012214430700452@us-mta-384.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PCiwA671eMeTV-LkfIzGCGPzxGTPzwwSVluC1YP6nNc_1769110986
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'soc-fixes-6.19-2' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/soc/soc

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2277363903

One or more kernel tests failed:
    Unrecognized or new issues:
        Reboot test
               s390x
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2277363903_s390x_kernel_kcidb_tool_20495341_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check

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
    /distribution/check-install [aarch64, x86_64]
    /distribution/command [aarch64, x86_64]
    /test/misc/machineinfo [aarch64, x86_64]
    Boot test [aarch64, x86_64]
    CKI/restraint [aarch64, x86_64]
    Reboot test [aarch64, x86_64]
    SELinux Custom Module Setup [aarch64, x86_64]
    selinux-policy: serge-testsuite [aarch64, x86_64]
    Storage - blktests - throtl [aarch64]
    Storage - blktests - ublk [aarch64]
    stress: stress-ng - cpu-cache [aarch64]
    stress: stress-ng - memory [aarch64]
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

