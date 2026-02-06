Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FE9278E5D
	for <llvm@lists.linux.dev>; Fri,  6 Feb 2026 15:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770390736; cv=none; b=Dc0Ku5cqAsK0wBPSYOe5lHM86z4xSQz+uUNuk9mY/i7feTVeeSr4Ag+pxt9pctlbBxWyJ/KUeB/fIjXESFE4miDHiIz0yTN/iTbiWmARABvAh+0v5XfPm4e+x/a1K0FmIaeKJrzXY0sg3btJGXau/Z/Z46ZgIG05QCOYYlnA9b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770390736; c=relaxed/simple;
	bh=VNe5vXtQj13EBvJCYU3zY/LNnYNad+aXepnxdRVvC4A=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Sj8/xdiOXEqQhkxEYykUPvnh2DKlbFy0fepbNZND7y1JmqkagcNp68R9w9WHU+kQQ8eJQIELxKtGIw5KELcNTy8vEIEX6LYRsfMC7xCpR8UWkWkA10DixEiRjajKVyr9JkaHRmuGAViesGyWTWMrV7twO7NymPkLlO4/+VauUgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q7Ydenne; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q7Ydenne"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770390734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=i7a3UQu7NaKWeNvYGAlMQgZB3SOvm7fJ5/BuhpW9uzw=;
	b=Q7YdenneR6tlxHm8kADj1RS4cF51r5sLvP7I4LLUxhIrHi/BTyWSte3n31Zxi609g4EsaB
	2RvqzDKaV/uoiVwlJBuCUwlK0/cKLsBf49ZHWP6Rv9Amu3rcf8DZcUDE6xI4VpsFpmYx3j
	TqFUNeq7J62XARSjgWweLX+vtBw4Zrw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-333-tvcRKk6_OcGsZVb8Q660UA-1; Fri,
 06 Feb 2026 10:12:13 -0500
X-MC-Unique: tvcRKk6_OcGsZVb8Q660UA-1
X-Mimecast-MFC-AGG-ID: tvcRKk6_OcGsZVb8Q660UA_1770390733
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C59171956094
	for <llvm@lists.linux.dev>; Fri,  6 Feb 2026 15:12:12 +0000 (UTC)
Received: from [172.20.128.30] (unknown [10.30.44.30])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 77CF518003F6;
	Fri,  6 Feb 2026 15:12:12 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 18 of 137): Test report for master
 (6.19.0-rc8, upstream-mainline, b7ff7151)
Date: Fri, 06 Feb 2026 15:12:12 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <88551.126020610121302101@us-mta-333.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: M8jmuDwrq85kkeyewlHQeWXuDcpeBF_UTbkekWrGiEo_1770390733
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: PASSED
             Merge: OK
           Compile: OK
              Test: OK

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: Merge tag 'hwmon-for-v6.19-final' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/groeck/linux-staging

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2309510001

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]
        Issue: avc: denied { getattr } for comm=3D"rpcbind" name=3D"/" dev=
=3D"pidfs" ino=3D1 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsys=
tem_u:object_r:pidfs_t:s0 tclass=3Dfilesystem permissive=3D0
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2417839
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: xfstests nfsv4.2 generic/309 FAIL on 6.19.0 as "mtime not up=
dated" and "ctime not updated"
            URL: https://lore.kernel.org/linux-nfs/20251219175955.4480-1-ok=
orniev@redhat.com/
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: [net] [kselftests upstream] catch all failures
            URL: https://issues.redhat.com/browse/RHELTEST-1362
            Affected tests:
                kselftests upstream - bpf [x86_64, x86_64]
                kselftests upstream - bpf_test_progs [x86_64, x86_64]
                kselftests upstream - net [x86_64, x86_64]


Tests that were not ran because of internal issues:
    /distribution/check-install [x86_64]
    /distribution/command [x86_64]
    /test/misc/machineinfo [x86_64]
    Boot test [x86_64]
    CKI/restraint [x86_64]
    Reboot test [x86_64]
    SELinux Custom Module Setup [x86_64]
    Storage - blktests - throtl [x86_64]
    Storage - blktests - ublk [x86_64]
    stress: stress-ng - cpu-cache [x86_64]
    stress: stress-ng - memory [x86_64]
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

