Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780C417579
	for <llvm@lists.linux.dev>; Sat, 14 Dec 2024 03:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734147133; cv=none; b=ByfaZsE4RHOtXEXtR8FByrKLhU1ZNJpKb936BEe9/HJQNyjf4XJ71pHd1NqwKSjGfKu4aNMBFDB5n9DWV8xxPA7DYtXLDRg3r/kI6PTwBGWn5mLUtSE36HBc2aSVzd7rOktlR36djLjxNTxMhajyYJ6MFWE/eGUiWp3tueTVGgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734147133; c=relaxed/simple;
	bh=ym9dLwOzcsXHiZLT8zcNyabp6RcZZUw49K8poCplbqM=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=ofYYRYvgsoRtmvrByUCdn97KwvXHgCxORg68oXJY5hrGAuIiXy7YJ/HZAfDucceDfXsKTp2yMhO8VWc44y4DSkX/bLJDOJFw5nlLkDFQocYeTGxivgSPnbqImxgu10ey79+C2N1Onh10z20khNnbHeEoOemUkJ/AbhhiKa13bBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fhqxnIMp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fhqxnIMp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734147130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XIuA6XdFhEEf21p+9w4tZju/ThfLU9q5Dc49k/leOaE=;
	b=fhqxnIMpkp41XzDcnUFZ690XkJWbadApm8938Kkm5DK15FwWnGipjPxKjD/Ov+ZqoaTMX/
	71Dl2FkVg/30Pj7rMQmDsWmi4MvPK8dUG/Yr3EfJAMUtE2PkBw+jTU1D7FE2nnlUZyUSZS
	N4PXP6cRZhQCBCXTZZSYGAohSwRY2PU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-491-dW1OA1fMMhSqLZd_p0RDwQ-1; Fri,
 13 Dec 2024 22:32:07 -0500
X-MC-Unique: dW1OA1fMMhSqLZd_p0RDwQ-1
X-Mimecast-MFC-AGG-ID: dW1OA1fMMhSqLZd_p0RDwQ
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5769319560B1
	for <llvm@lists.linux.dev>; Sat, 14 Dec 2024 03:32:06 +0000 (UTC)
Received: from [172.64.12.26] (unknown [10.30.33.24])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E6D551956052;
	Sat, 14 Dec 2024 03:32:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0-rc2,
 upstream-mainline, f8613561)
Date: Sat, 14 Dec 2024 03:32:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <29140.124121322320700100@us-mta-491.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vbNmUdt2Tfzei8RkmNEU3BjJ6S46-KwFrBHz6F3a7b0_1734147126
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'spi-fix-v6.13-rc2' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/broonie/spi

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1588504184

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1588504184-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1588504184-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1588504184-x86_64-kernel
                   Issue: Kernel build: arch/x86/tools/insn_decoder_test: e=
rror: malformed line
                          https://github.com/Rust-for-Linux/linux/issues/11=
34


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

