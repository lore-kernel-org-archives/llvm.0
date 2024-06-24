Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B461E869
	for <llvm@lists.linux.dev>; Mon, 24 Jun 2024 15:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719241944; cv=none; b=HtKD8FF1S7hVICHCiD8U+PZJH2lXmwtNjS8do57fIAek9xiTgDwxEXRKklDl4SPIuHbKQWqoouphLgdtfT4zxbgZt1yao+aMcwoxbE0hiKeufNtxxI9UTIKFdkOxSRJbcyCzkosFb9EbYk+Xw5O+m3RzZ+wNPjlZemZ36fwcIRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719241944; c=relaxed/simple;
	bh=4E/H4rmvWXamwH9c03RSwYuTc15FrXDWXbU0BQbUFmw=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=D2YWawvh2CHo7OakdLe+a8YQZLwhGYL0NjidnNAp12QMzKB75OT321vvzyfMEdKt8oTUL/ZYehpuNeJ83Rvjf8I+4GksVi6kkEJFwzb2gV8dIlhEU55x2xhFa5XQox+DbX/P084rT2LpE3nVfw/5TEG/v5vqcq6FnHVeNCnYybA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UGLnUcf2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UGLnUcf2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719241941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8R6rt+99cSxGyZhBRu8W3ETIGlKu6UEP1MZNwIexAYU=;
	b=UGLnUcf2fV6hFTPHjtTvGLlh4DScbC4sYkU23gMsvAcjXdmVekrLcA9D/P4PkEbTTYCaGu
	6asx3mSdE3rzox3Qeq//7TLzVxSpLn3Iv5ZFWg/5gKZFnXgWGHXnwl/DUVE0BSKkOkBUca
	4VCHyLYS8mWS7bKQngxaBb+hMa7oHSI=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-137-NIl-DvBmO7u_SvhMYyUc6A-1; Mon,
 24 Jun 2024 11:12:19 -0400
X-MC-Unique: NIl-DvBmO7u_SvhMYyUc6A-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 99E7419560AD
	for <llvm@lists.linux.dev>; Mon, 24 Jun 2024 15:12:18 +0000 (UTC)
Received: from [172.64.15.9] (unknown [10.30.34.46])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E25571955E83;
	Mon, 24 Jun 2024 15:12:17 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 10 of 192): Test report for master
 (6.10.0-rc5, mainline.kernel.org-clang, f2661062)
Date: Mon, 24 Jun 2024 15:12:17 -0000
To: bgoncalv@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <87798.124062411121901777@us-mta-137.us.mimecast.lan>
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
    Commit message: Linux 6.10-rc5

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1344527840

One or more kernel tests failed:
    Unrecognized or new issues:
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1344527840-x86_64-kernel_upt_35
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [rhel-10] xfstests - cifsv3.11 - generic/207 - error in bloc=
k: expected 4096 bytes, received 0
            URL: https://issues.redhat.com/browse/RHEL-39974
            Affected tests:
                xfstests - cifsv3.11 [x86_64, x86_64 (debug)]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]


Tests that were not ran because of internal issues:=20
    Boot test [s390x]
    CKI/restraint [s390x]
    machineinfo [s390x]
    Reboot test [s390x]
    SELinux Custom Module Setup [s390x]
    Storage - blktests - blk - upstream [s390x]
    Storage - blktests - nvme-tcp - upstream [s390x]
    Storage - swraid scsi_raid [s390x]
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

