Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC86F27732
	for <llvm@lists.linux.dev>; Wed, 24 Jun 2026 11:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782299532; cv=none; b=YBm7x75XUigt7pTddsi14ooGQu3gKhpy5G3FHktWeseb4h4a7bz9m1JEiKi0MK8N98TxQF9Xh3EBAFjNeA+FkWfLycuBhV5hsHC6IaiVVvgL4J7zx0drvxjl0gE1huCtwkHsVWn2nhamKNw5Bobq1gjiLhcvHFwyj5c0XdluE9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782299532; c=relaxed/simple;
	bh=lyI/5Y84D8DohiVab6JiE8+myk3ZhmlKHISoVOlEcgw=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=I3Ezxzb/XU0Nf38iQHxrQdQUhL4wnk+PJwDOmR+BzOuCcD8J0j/SSrYCCeThEzCzeUQmLnlC2/zdZGlAJRsw0qA9gH3dtyqJWfgdXasBKNFl0mgw7fu8STRuo9rWYFDh83J0EdgkEirmcxIsEPZi8GPCxzwxnHEzAs3hyGQOmiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UNOhuXW5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UNOhuXW5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782299529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MQx26jTWR9corejUxEQLJfNHECMK0OO5Eljsxa6dv9c=;
	b=UNOhuXW5ddA6L+cCL6X3tJli9R5Igqi2dJ4lZ8p/PAfpkj3HsL9FvfIT9eCbMlhFhUBwBg
	0kkPBF+YVuYigfSJFmPxdqZtIoTz1hjMrnAzq/SGik/OfDzbBnnDC2vBLz0vh+FH0ApGoV
	JmTr75N4fLHXMdAyIspvXSSSw1N8lYs=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-180-PGSaNfpTPfSVL5iYfwAqVQ-1; Wed,
 24 Jun 2026 07:12:08 -0400
X-MC-Unique: PGSaNfpTPfSVL5iYfwAqVQ-1
X-Mimecast-MFC-AGG-ID: PGSaNfpTPfSVL5iYfwAqVQ_1782299527
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 53904195606D
	for <llvm@lists.linux.dev>; Wed, 24 Jun 2026 11:12:07 +0000 (UTC)
Received: from [172.20.208.154] (unknown [10.30.45.50])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8F09736927;
	Wed, 24 Jun 2026 11:12:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-0,
 upstream-mainline, 558ef39a)
Date: Wed, 24 Jun 2026 11:12:06 -0000
To: fs-test@redhat.com, bgoncalv@redhat.com, ftjahjad@redhat.com,
 llvm@lists.linux.dev, omosnace@redhat.com, mmalik@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
Message-Id: <51815.126062407120800391@us-mta-180.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IOJiN0DkR1sfUoPnz08bUlUN4Q_2Cv8rZD9rEY97dHY_1782299527
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'dmaengine-7.2-rc1' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/vkoul/dmaengine

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2624342878

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2624342878_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2624342878_aarch64_kernel_kcidb_tool_21513322_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        Reboot test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2624342878_aarch64_kernel_kcidb_tool_21513322_11
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
        selinux-policy: serge-testsuite
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2624342878_aarch64_kernel_kcidb_tool_21513323_7
                   Non-passing ran subtests:
                       =E2=9A=A1 ERROR Setup
                       =E2=9D=8C FAIL Test
               s390x
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2624342878_s390x_kernel_kcidb_tool_21513316_7
                   Non-passing ran subtests:
                       =E2=9A=A1 ERROR Setup
                       =E2=9D=8C FAIL Test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2624342878_x86_64_kernel_kcidb_tool_21513320_7
                   Non-passing ran subtests:
                       =E2=9A=A1 ERROR Setup
                       =E2=9D=8C FAIL Test
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2624342878_x86_64_kernel_kcidb_tool_21513321_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301



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

