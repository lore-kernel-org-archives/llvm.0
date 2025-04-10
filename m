Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80914BA33
	for <llvm@lists.linux.dev>; Thu, 10 Apr 2025 01:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744249329; cv=none; b=ICVkyGVtx13C/C3dZ6RPUpNJt0kwClz/I2RzHRIV3wQh6d2lZ6wdHko8uym6s4z/6fDIVIpexvk8wLRBREiujg4LSlOMuyZFUwlSk+OEqty5jBZoZLo64yGLVOZeMn/XNugvFzFLUMfUtdAdmjzfImjczAjEe7SOebSgDhs4hf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744249329; c=relaxed/simple;
	bh=1KsaHV21Xe6xiXGbJ19Z46o7gh7AdTdYtIPDPSSY7A0=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=pbMMluqOlykqu/Lr+PLDO8Zk8ujAsP5VbbRU72tUtnk9qYT+AQjdVmzvGepmoMY0PYESa3jS6SFvNzCEkhCX8E9Lc7rg1tfpX6RlYZ5ckNuLSAW00M1qLMhUQO/+3DTNbK0HY76AfCJfMFsZcAfB2JlJ3opgovW21serEDljAuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LrhCz2G0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LrhCz2G0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744249326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TLmYIsZrYmUq/4cVOEg59542dSFrxgMfQx8wETfmRJw=;
	b=LrhCz2G0QoD7pH5f/oA+pPrXwdDMhr+HLbai1FMyBab1BfYJT0Lz/fVvxeuzx0B+pchFHV
	Tbw3N//+lmSul6a1IrDKKoSRq1mHXOdIBOqWXzTBv8WosLy7UP6X6xmzhWC+ngdL0D+/IA
	bQPVGLL5alie+qQgaGi0fSc21zjiUAE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-417-_X3MIGxWObOQItKttn1e_Q-1; Wed,
 09 Apr 2025 21:42:04 -0400
X-MC-Unique: _X3MIGxWObOQItKttn1e_Q-1
X-Mimecast-MFC-AGG-ID: _X3MIGxWObOQItKttn1e_Q_1744249324
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D65A4180034D
	for <llvm@lists.linux.dev>; Thu, 10 Apr 2025 01:42:03 +0000 (UTC)
Received: from [172.20.65.13] (unknown [10.30.44.73])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 770861956094;
	Thu, 10 Apr 2025 01:42:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc1,
 upstream-mainline, 3b07108a)
Date: Thu, 10 Apr 2025 01:42:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <93503.125040921420400985@us-mta-417.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5ZV2rIhRTIP319_wGp_APg5R9GBtf2Mmv7YZu3iDMN4_1744249324
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'linux_kselftest-fixes-6.15-rc2' of git://git=
.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1761360461

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1761360461-x86_64-kernel-debug


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

