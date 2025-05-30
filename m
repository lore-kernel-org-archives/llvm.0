Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C8B230BF6
	for <llvm@lists.linux.dev>; Fri, 30 May 2025 14:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748614933; cv=none; b=tRRAYX88mGN8wdYD24o2v/XfnxMVyaKMn9x/u+x5Wey+ANDjETITw7owE0L5gffqQfwxgE2UXGsBnP/zjZ7CSr3BGTWFBW7YumYRj3q0nKndO1F1FNF5UP7DQy4y7yh62oglabu1zlfc6OIxv8efJFwsGfRkNHm0ugErN4ENzSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748614933; c=relaxed/simple;
	bh=mxQ+JaoD596doXYulMG9i2P8CdTnc6KTSEEiTR1oVzg=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=sIWoC7a71CkmYjLtBQZfN8Yul7tTT4jJYR9T6qtgOwoMvkTXTtY7S9IRcHkYVzuJSwcPyeYB5gRS5E3rkQ/LihAq1msZOa+/93tugoMXaSHJMzsnc/pvqQNiScKK188Qq01Amh99gs67YViy8Laugl+uqiM7uxjz+Q0i/X9VtEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ci9hE2+r; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ci9hE2+r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748614931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/gVnvcLMPIiEj3qjlu3nAfm9rAmNe11iSiGRqg4CtGk=;
	b=Ci9hE2+r+3DMmJk2lwAbTm6tAHmwMGmrz2fGmLcKmpvBIlNUG0Q7jgJINb83BidDEsiFGq
	/sPNYOLuCl0eEb4SyrV/CAQapHYe+MIPWBCF2nNKIzjGxzJ4z2hadngnZkmNBOQ2H6nPkp
	3KyYr9Hlpp7sRm/kajD4MZObUzb5mb8=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-600--6t37nXyMRaIbBLAtIErbQ-1; Fri,
 30 May 2025 10:22:07 -0400
X-MC-Unique: -6t37nXyMRaIbBLAtIErbQ-1
X-Mimecast-MFC-AGG-ID: -6t37nXyMRaIbBLAtIErbQ_1748614926
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4C258195608E
	for <llvm@lists.linux.dev>; Fri, 30 May 2025 14:22:06 +0000 (UTC)
Received: from [172.20.48.73] (unknown [10.30.45.91])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5DCAD180087C;
	Fri, 30 May 2025 14:22:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 6 of 100): Test report for master
 (6.15.0, upstream-mainline, 1cbf99e4)
Date: Fri, 30 May 2025 14:22:05 -0000
To: omosnace@redhat.com, ftjahjad@redhat.com, mmalik@redhat.com,
 bgoncalv@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <55972.125053010220701226@us-mta-600.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZJickpVZpvZNwCyh33lW_hrzbCIG5PokOiWhuESwNJc_1748614926
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'jfs-6.16' of github.com:kleikamp/linux-shagg=
y

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1841793904

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1841793904-x86_64-kernel-debug_upt_4
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1841793904-x86_64-kernel-debug_upt_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
        selinux-policy: serge-testsuite
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1841793904-ppc64le-kernel_upt_5
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Test

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [aarch64][coresight_etm4x][kernel 5.19.0] coresight-etm4x: p=
robe of ARMHC500:20 failed with error -17
            URL: https://lore.kernel.org/all/CA+QYu4ogiTa1V20aqxFqBrMH0z927=
YNNN2O=3DCKma+=3DM_8E81iQ@mail.gmail.com/
            Affected tests:
                Boot test [aarch64]
                Reboot test [aarch64]


Tests that were not ran because of internal issues:
    Reboot test [x86_64]
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

