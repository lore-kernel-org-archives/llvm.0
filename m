Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913081C173C
	for <llvm@lists.linux.dev>; Wed, 11 Dec 2024 23:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733959989; cv=none; b=Dk5nanD6qX0Lz3kxQbXq0xPvlxHt7d/c7+FCUo3ahqxj+gGiFr8iXYRix8hr4S+zfFlSOLPmJdrH7V5jAnw3R99wiFJOINbedU1i5uLsQl+5vg7UEsAp57DxReMgoTYlm91elJ+vh7jBIgUAbGJwROXlAwDRQXyXZX1SHWeKD6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733959989; c=relaxed/simple;
	bh=73VTOqnu3bnyKjZkR8cyuthvIq6ceBRmnVYhKo6fRv0=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=m4FWml0My6ZBCwECpWrw3TzbG7OMeQQ5c/zcNui4rF2Ml5TnkwolBmTlLgtZ1ggRM6uPha0fcau5DwoN0SEd//dJ/eWw2HzhUf0VDPsLzJCFffhLjh7l90jVIrF4zNrlsJoaCQwdOVHSc/5JrGArPdJAZa0BofZ9o6xzoTxrp9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dgDMJsz9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dgDMJsz9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733959985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Sw16+vUmukigxIn1TzNT5L9UTpTvdAolFHqE//mOdrY=;
	b=dgDMJsz9JTOvpTPl0bli7m8mRdkq6daoHhIy1bqvSmFX8dXSBR7SPBfrA9HGABX0GoMxQQ
	iwoNCJwpkBs6dlifrpGNP7sQ8xvuauMUt0Y5nAd7OKNX3QuGiPwFKiH+wohpkjJwKOStIy
	2PA5HcDTAms/aWc5AlDJm8/UEL9MRO0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-26-8tBAlNmbPQWr0JrU1n7-uA-1; Wed,
 11 Dec 2024 18:33:04 -0500
X-MC-Unique: 8tBAlNmbPQWr0JrU1n7-uA-1
X-Mimecast-MFC-AGG-ID: 8tBAlNmbPQWr0JrU1n7-uA
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8BA571955F40
	for <llvm@lists.linux.dev>; Wed, 11 Dec 2024 23:33:03 +0000 (UTC)
Received: from [172.64.12.26] (unknown [10.30.33.24])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 13D9E195605A;
	Wed, 11 Dec 2024 23:33:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0-rc2,
 upstream-mainline, 231825b2)
Date: Wed, 11 Dec 2024 23:33:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <78202.124121118330400333@us-mta-26.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: s0sCLKT9dmWV096O6yyCI7uY8tCQHpUMlNLVYTEVQp8_1733959983
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Revert "unicode: Don't special case ignorable code poin=
ts"

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1584809238

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1584809238-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1584809238-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1584809238-x86_64-kernel
                   Issue: Kernel build: arch/x86/tools/insn_decoder_test: e=
rror: malformed line
                          https://github.com/ClangBuiltLinux/linux/issues/2=
060


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

