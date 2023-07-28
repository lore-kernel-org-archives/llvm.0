Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAA227148
	for <llvm@lists.linux.dev>; Fri, 28 Jul 2023 04:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690519213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bTwS1qWPlp2ImEWJ7NOwgih1wK+KR5EXR+d6siHnFCQ=;
	b=Lrg4EtMrTAdz8nG4ucyo+MQ5AZkp9yjEn3I7tEmunwczoKVyTDishWSN467ySJaNSY2zIO
	FtlNQnwuM/HAEt+QY2eRqDOVV02Be5w42XMNd01XsNFf72VEHeISavW19ZbF3zKPkxAe7T
	DT0ELih6pinrgJL+afCVeAVv2oSLRhA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-x2CXPp-oMhC-01uO-IOhKw-1; Fri, 28 Jul 2023 00:40:12 -0400
X-MC-Unique: x2CXPp-oMhC-01uO-IOhKw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD487805951
	for <llvm@lists.linux.dev>; Fri, 28 Jul 2023 04:40:11 +0000 (UTC)
Received: from [172.64.4.113] (unknown [10.30.32.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ACB83200BA7C;
	Fri, 28 Jul 2023 04:40:11 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (SKIPPED 191 of 328): Test report for master
 (6.5.0-rc3, mainline.kernel.org-clang, 57012c57)
Date: Fri, 28 Jul 2023 04:40:11 -0000
To: bgoncalv@redhat.com, yiyan@redhat.com, llvm@lists.linux.dev,
 bhe@redhat.com, xiawu@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Message-Id: <07115.123072800401200139@us-mta-438.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'net-6.5-rc4' of git://git.kernel.org/pub/scm=
/linux/kernel/git/netdev/net

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/97648

One or more kernel tests failed:
    Unrecognized or new issues:
          x86_64 - kdump - sysrq-c
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
8928580
                   Non-passing subtests:
                       =E2=9D=8C FAIL /kdump/crash-sysrq-c
          x86_64 - kdump - file-load
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
8928581
                   Non-passing subtests:
                       =E2=9D=8C FAIL /kdump/crash-sysrq-c
          x86_64 (debug) - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
8928644
                   Non-passing subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck

    We also see the following known issues which are not related to your ch=
anges:
        Issue: kdump - kexec_boot: image_arm64_probe: Bad arm64 image heade=
r
            URL: https://issues.redhat.com/browse/RHELPLAN-138156
            Affected tests:
                 aarch64 - kdump - kexec_boot
                 aarch64 - kdump - kexec-file-load
        Issue: Firmware test suite: mv: cannot stat 'dtcompilerparser.tab.c=
': No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1544
            Affected tests:
                 aarch64 - Hardware - Firmware test suite
        Issue: xfstests generic/173 failing on ark-eln aarch64
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1989409
            Affected tests:
                 aarch64 - xfstests - btrfs



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

